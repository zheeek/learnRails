require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chef.new(name:"amin" , email:"amin@email.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  test "chef should be percense" do
    @chef.name=""
    assert_not @chef.valid?
  end
  test "name should not be long" do
    @chef.name = 'a'* 101
    assert_not @chef.valid?
  end
end
