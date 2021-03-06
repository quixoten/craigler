require 'open-uri'
require 'hpricot'

require 'craigler/constants'
require 'craigler/search'

module Craigler
  class CraiglerError < StandardError; end
  class InvalidCategory < CraiglerError; end
  class InvalidSearchTerm < CraiglerError; end
  class InvalidLocation < CraiglerError; end

  class << self
    # Alternate interface to {Search#initialize}
    #
    # @param category [Symbol] the category to search
    # @param options [Hash] options passed to {Search#initialize}.
    def search(category, options = {})
      options = options.merge({ :only => category })
      results = Search.new(options.delete(:for), options).results()
      results.each {|result| yield(result) } if block_given?
      results
    end

    # Wrapper for {Search#initialize}
    #
    # @param (see Search#initialize)
    def find(search_term, options = {})
      results = Search.new(search_term, options).results()
      results.each {|result| yield(result) } if block_given?
      results
    end
  end
end
