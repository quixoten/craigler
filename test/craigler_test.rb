require 'test_helper'

class CraiglerTest < Test::Unit::TestCase
  context "Search interface" do
    should "respond to search" do
      assert_respond_to(Craigler, :search)
    end
    
    should "yield results to a block if given" do
      yielded = false 
      Craigler::search(:motorcycles, :in => :utah, :for => 'Yamaha', :page_limit => 1) do
        yielded = true; break;
      end
      
      assert(yielded, "results were never yielded to the block")
    end
  end
  
  context "Find interface" do
    should "respond to find" do
      assert_respond_to(Craigler, :find)
    end
    
    should "yield results to a block if given" do
      yielded = false 
      Craigler::find('Yamaha', :in => :utah, :only => :motorcycles, :page_limit => 1) do
        yielded = true; break;
      end
      
      assert(yielded, "results were never yielded to the block")
    end
  end
end
