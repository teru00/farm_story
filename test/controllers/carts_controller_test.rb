require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def setup
    @cart = carts(:one)
  end

  test "should get show" do
    get :show, id: @cart.id
    assert_response :success
  end

end
