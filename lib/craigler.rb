require 'open-uri'
require 'Hpricot'

require 'craigler/constants'
require 'craigler/search'

module Craigler
  class CraiglerError < StandardError; end
  class InvalidCategory < CraiglerError; end
  class InvalidSearchTerm < CraiglerError; end
  class InvalidLocation < CraiglerError; end
  
  class << self
    # Interface to Search that may or may not be more readable
    def search(category, options = {})
      options = { :only => category }.merge(options)
      results = Search.new(options.delete(:for), options).results()
      results.each {|result| yield(result) } if block_given?
      results
    end
    
    # Interface to Search that somewhat mimics ActiveRecord#find
    #
    # Supports all the options of Search#new
    def find(search_term, options = {})
      results = Search.new(search_term, options).results()
      results.each {|result| yield(result) } if block_given?
      results
    end
  end
end