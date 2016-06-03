require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup 
    @product = Product.new(name: "tomato", content: "greate tomato", price: 200)
  end
  test "should be valid" do
    assert @product.valid?
  end
end
