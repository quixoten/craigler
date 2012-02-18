require 'erb'

module Craigler
  class Search
    include ERB::Util
    
    attr_reader :search_term, :categories, :locations, :page_limit
    
    # Creates a wrapper object for a craigslist search
    #
    # @param [String] search_term
    # @option options [Symbol, Array] :in (:anywhere) location(s) to search
    # @option options [Symbol, Array] :only (:all_for_sale_or_wanted) category or categories to search
    # @option options [Fixnum] :page_limit (4) maximum number of pages to read per url
    # @note A location often has more than one url associated with it. For example, [`:california`](http://geo.craigslist.org/iso/us/ca) has 29 associated urls as of this writing. In this case, up to 116 pages could potentially be searched (`:page_limit * num_urls = 4 * 29 = 116`).
    def initialize(search_term, options = {})
      raise InvalidSearchTerm if search_term.nil? || search_term == ''
      
      options       = {:in => :anywhere, :only => :all_for_sale_or_wanted, :page_limit => 4}.merge(options)
      options[:in]  = LOCATIONS.keys if options[:in] == :anywhere
      @locations    = (options[:in].is_a?(Array) ? options[:in] : [options[:in]]).collect(&:to_sym)
      @categories   = (options[:only].is_a?(Array) ? options[:only] : [options[:only]]).collect(&:to_sym)
      @page_limit   = options[:page_limit]
      @search_term  = search_term
      @results      = nil
      
      _validate_locations()
      _validate_categories()
    end
    
    # Returns the results of the search. If this is the first time
    # calling #results then they will be fetched over the internet and cached in the search object.
    #
    # @option options [Boolean] :refresh (false) force the results to be updated before they are returned
    def results(options = {})
      options = { :refresh => false }.merge(options)
      return @results unless @results.nil? || options[:refresh]
      
      @results  = []
      last_page = @page_limit - 1 # pages start at 0
      
      _for_each_locations_search_url() do |location, url|
        (0..last_page).each do |page|
          results = _extract_items_from_url(location, "#{url}&s=#{page*25}")
          @results.push(*results)
          break if results.size < RESULTS_PER_PAGE
        end
      end
      
      results
    end
    
    protected
    def _validate_locations
      @locations.each() do |location|
        raise InvalidLocation.new(":anywhere not expected as part of an array") if location == :anywhere
        raise InvalidLocation.new(":#{location} is not a valid location") unless LOCATIONS.key?(location)
      end
    end
    
    def _validate_categories
      @categories.each() do |category|
        raise InvalidCategory unless CATEGORIES.key?(category)
      end
    end
    
    def _for_each_locations_search_url
      @locations.each do |location|
        LOCATIONS[location].each do |url|
          @categories.each do |category|
            yield(location, "#{url}search/#{CATEGORIES[category]}?query=#{url_encode(@search_term)}&format=rss")
          end
        end
      end
    end
    
    def _extract_items_from_url(location, url)
      (Hpricot(open(url))/'item').collect { |item| {
        :url          => item['rdf:about'],
        :title        => (item%'title').inner_text,
        :location     => location.to_s,
        :published_at => Time.parse((item%'dc:date').inner_text)
      }}
    end
  end
end
