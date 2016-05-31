require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "example", password_confirmation: "example")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be presence" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be presence" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a"*41
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*256
    assert_not @user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email addresse should be unique" do
    duplicate_user = @user.dup
    @user.sabe
    assert_not duplicate_user.valid?
  end
  
  test "password should be (nonblank)" do
    @user.password = @user.password_confirmation = "  "
    assert_not @user.valid?
  end
  
  test "password should be not short" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
      
    end
end
