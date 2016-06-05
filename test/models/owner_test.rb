require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  test "name should not be nonblnak" do
    owner = Owner.new
    assert_not owner.valid?
    assert_equal [:name], owner.errors.keys
  end
end
