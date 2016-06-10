class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
  def sub_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item.quantity > 1
      current_quantity = current_item.quantity - 1
      current_item.update_attributes(quantity: current_quantity)
    else
      current_item.destroy
    end
  end
end
