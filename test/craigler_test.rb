require 'test_helper'

class CraiglerTest < Test::Unit::TestCase
  should "respond to search" do
    assert_respond_to(Craigler, :search)
  end
  
  should "respond to find" do
    assert_respond_to(Craigler, :find)
  end
end
