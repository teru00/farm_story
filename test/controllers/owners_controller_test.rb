require 'test_helper'

class OwnersControllerTest < ActionController::TestCase
  def setup
    @owner = owners(:one)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @owner.id
    assert_response :success
  end

end
