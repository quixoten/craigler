module Craigler
  module ASIA
    STATES = { :bangladesh => [:bangladesh]
             , :china => [:beijing, :chengdu, :chongqing, :dalian, :guangzhou, :hangzhou, :nanjing, :shanghai, :shenyang, :shenzhen, :wuhan, :xian]
             , :hong_kong => [:hongkong]
             , :india => [:ahmedabad, :bangalore, :bhubaneswar, :chandigarh, :chennai, :delhi, :goa, :hyderabad, :indore, :jaipur, :kerala, :kolkata, :lucknow, :mumbai, :pune, :surat]
             , :indonesia => [:jakarta]
             , :iran => [:tehran]
             , :iraq => [:baghdad]
             , :israel_and_palestine => [:haifa, :jerusalem, :ramallah, :telaviv]
             , :japan => [:fukuoka, :hiroshima, :nagoya, :okinawa, :osaka, :sapporo, :sendai, :tokyo]
             , :korea => [:seoul]
             , :kuwait => [:kuwait]
             , :lebanon => [:beirut]
             , :malaysia => [:malaysia]
             , :micronesia => [:micronesia]
             , :pakistan => [:pakistan]
             , :philippines => [:bacolod, :cdo, :cebu, :davaocity, :iloilo, :manila, :naga, :pampanga, :zamboanga]
             , :singapore => [:singapore]
             , :taiwan => [:taipei]
             , :thailand => [:bangkok]
             , :united_arab_emirates => [:dubai]
             , :vietnam => [:vietnam]
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
