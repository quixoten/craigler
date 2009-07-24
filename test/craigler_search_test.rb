require 'test_helper'

class CraiglerSearchTest < Test::Unit::TestCase
  context "creating a search" do
    should "require a valid category" do
      assert_raises(Craigler::InvalidCategory) do
        Craigler::Search.new('Yamaha Radian', :only => :invalid)
      end
    end
    
    should "require a search term" do
      assert_raises(Craigler::InvalidSearchTerm) do
        Craigler::Search.new(nil)
      end
      
      assert_raises(ArgumentError) do
        Craigler::Search.new()
      end
    end
    
    should "not require a location" do
      assert_nothing_raised() do
        Craigler::Search.new('Yamaha Roadstar Warrior', :only => :motorcycles)
      end
    end
    
    should "not require a category" do
      assert_nothing_raised() do
        Craigler::Search.new('Honda Shadow', :in => :utah)
      end
    end
    
    should "require that the location is valid" do
      assert_raises(Craigler::InvalidLocation) do
        Craigler::Search.new('Honda Nighthawk', :in => :invalid)
      end
    end
    
    should "accept multiple locations" do
      assert_nothing_raised() do
        Craigler::Search.new('Suzuki Boulevard M50', :in => [:utah, :nevada])
      end
    end
  end
  
  context "fetching search results" do
    setup do
      @search = Craigler::Search.new('Honda', :in => :utah, :only => :motorcycles)
    end
    
    should "return an array of hashes" do
      results = @search.results()
      assert(results.is_a?(Array), "Array exptected but was #{results.class}")
      assert(results.size > 0, "No results were returned")
      assert(results.inject(true) {|t,r| t && r.is_a?(Hash)})
    end
    
    should "allow us to limit the number of pages searched" do
      one_page_count  = @search.results(:page_limit => 1).size
      two_page_count  = @search.results(:page_limit => 2, :refresh => true).size
      assert(one_page_count < two_page_count, "#{one_page_count} is not less than #{two_page_count}")
    end
  end
end
