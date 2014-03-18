require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "should not save without phone number" do
    restaurant = restaurants(:restaurant_without_phone_number)
    assert !restaurant.save
  end

  test "should not save without name" do
    restaurant = restaurants(:restaurant_without_name)
    assert !restaurant.save
  end

end