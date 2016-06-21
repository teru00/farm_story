require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "lauout links" do
    get root_path
    assert_template 'products/index'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", about_path
    get signup_path
    assert_select "title", provide_title("Sign up")
  end
end
