module Craigler
  module LATAM
    STATES = { :argentina => [:buenosaires]
             , :bolivia => [:lapaz]
             , :brazil => [:belohorizonte, :brasilia, :curitiba, :fortaleza, :portoalegre, :recife, :rio, :salvador, :saopaulo]
             , :caribbean => [:caribbean]
             , :chile => [:santiago]
             , :colombia => [:colombia]
             , :costa_rica => [:costarica]
             , :dominican_republic => [:santodomingo]
             , :ecuador => [:quito]
             , :el_salvador => [:elsalvador]
             , :guatemala => [:guatemala]
             , :mexico => [:acapulco, :bajasur, :chihuahua, :guadalajara, :guanajuato, :hermosillo, :juarez, :mazatlan, :mexicocity, :monterrey, :oaxaca, :puebla, :pv, :tijuana, :veracruz, :yucatan]
             , :nicaragua => [:managua]
             , :panama => [:panama]
             , :peru => [:lima]
             , :puerto_rico => [:puertorico]
             , :uruguay => [:montevideo]
             , :venezuela => [:caracas]
             , :virgin_islands_us => [:virgin]
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
