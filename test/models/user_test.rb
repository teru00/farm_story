require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "example", password_confirmation: "example")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "password should be blank" do
    assert_not @user.password.empty?
  end
  
  test "name should be nonblank" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "should be not too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end
  
  test "email should be nonblank" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email should be not too long" do
    @user.email = "a"*256
    assert_not @user.valid?
  end
end