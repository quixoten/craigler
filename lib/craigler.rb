require 'open-uri'
require 'Hpricot'

require 'craigler/constants'
require 'craigler/search'

module Craigler
  VERSION = '0.1.0'
  
  class CraiglerError < StandardError; end
  class InvalidCategory < CraiglerError; end
  class InvalidSearchTerm < CraiglerError; end
  class InvalidLocation < CraiglerError; end
  
  class << self
    def search(category, options = {})
      search = Search.new(options[:for], :in => (options[:in] || :anywhere), :only => category)
    end
    
    def find(search_term, options = {})
      search = Search.new(search_term, options)
    end
  end
end