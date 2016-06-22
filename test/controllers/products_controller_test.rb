require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  def setup
    @admin_user = users(:terufumi)
    @noadmin_user = users(:akihisa)
    @product = products(:tomato)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should redirect create when no admin user" do
    log_in_as(@noadmin_user)
    assert_no_difference 'Product.count' do
      post :create, product: { name: "tomato" }
    end
    assert_redirected_to root_path
  end
  
  test "should redirect destroy when no admin user" do
    log_in_as(@noadmin_user)
    assert_no_difference 'Product.count' do
      delete :destroy, id: @product 
    end
  end
end
