module Craigler
  module CA
    STATES = { :alberta => [:calgary, :edmonton, :ftmcmurray, :hat, :lethbridge, :peace, :reddeer]
             , :british_columbia => [:abbotsford, :cariboo, :comoxvalley, :cranbrook, :kamloops, :kelowna, :nanaimo, :princegeorge, :skeena, :sunshine, :vancouver, :victoria, :whistler]
             , :manitoba => [:winnipeg]
             , :new_brunswick => [:newbrunswick]
             , :newfoundland_and_labrador => [:newfoundland]
             , :northwest_territories => [:territories, :yellowknife]
             , :nova_scotia => [:halifax]
             , :ontario => [:barrie, :belleville, :brantford, :chatham, :cornwall, :guelph, :hamilton, :kingston, :kitchener, :londonon, :niagara, :ottawa, :owensound, :peterborough, :sarnia, :soo, :sudbury, :thunderbay, :toronto, :windsor]
             , :prince_edward_island => [:pei]
             , :quebec => [:montreal, :quebec, :saguenay, :sherbrooke, :troisrivieres]
             , :saskatchewan => [:regina, :saskatoon]
             , :yukon_territory => [:whitehorse]
             }

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
end
