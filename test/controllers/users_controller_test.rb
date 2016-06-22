require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:terufumi)
    @other_user = users(:akihisa)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get index when no logged in" do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should get index when logged in" do
    log_in_as(@user)
    get :index
    assert_response :success
  end
  
  test "should get show" do
    get :show, id: @user.id
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end
  
end
