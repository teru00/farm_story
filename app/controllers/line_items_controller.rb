class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    #@line_item = @cart.line_items.build(product_id: product.id)
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to @line_item.cart
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @cart = current_cart
    product = Product.find(params[:id])
    @cart.sub_product(product.id)
    redirect_to @cart
  end
end
