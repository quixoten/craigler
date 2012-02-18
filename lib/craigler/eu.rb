module Craigler
  module EU
    STATES = { :austria => [:vienna]
             , :belgium => [:brussels]
             , :bulgaria => [:bulgaria]
             , :croatia => [:zagreb]
             , :czech_republic => [:prague]
             , :denmark => [:copenhagen]
             , :finland => [:helsinki]
             , :france => [:bordeaux, :cotedazur, :grenoble, :lille, :loire, :lyon, :marseilles, :montpellier, :paris, :rennes, :rouen, :strasbourg, :toulouse]
             , :germany => [:berlin, :bremen, :cologne, :dresden, :dusseldorf, :essen, :frankfurt, :hamburg, :hannover, :heidelberg, :kaiserslautern, :leipzig, :munich, :nuremberg, :stuttgart]
             , :greece => [:athens]
             , :hungary => [:budapest]
             , :iceland => [:reykjavik]
             , :ireland => [:dublin]
             , :italy => [:bologna, :florence, :genoa, :milan, :naples, :perugia, :rome, :sardinia, :sicily, :torino, :venice]
             , :luxembourg => [:luxembourg]
             , :netherlands => [:amsterdam]
             , :norway => [:oslo]
             , :poland => [:warsaw]
             , :portugal => [:faro, :lisbon, :porto]
             , :romania => [:bucharest]
             , :russian_federation => [:moscow, :stpetersburg]
             , :spain => [:alicante, :baleares, :barcelona, :bilbao, :cadiz, :canarias, :granada, :madrid, :malaga, :sevilla, :valencia]
             , :sweden => [:stockholm]
             , :switzerland => [:basel, :bern, :geneva, :lausanne, :zurich]
             , :turkey => [:istanbul]
             , :ukraine => [:ukraine]
             , :united_kingdom => [:aberdeen, :bath, :belfast, :birmingham, :brighton, :bristol, :cambridge, :cardiff, :coventry, :derby, :devon, :dundee, :eastmids, :edinburgh, :essex, :glasgow, :hampshire, :kent, :leeds, :liverpool, :london, :manchester, :newcastle, :norwich, :nottingham, :oxford, :sheffield]
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
