class OrdersController < ApplicationController
  def new
    @order = Oder.new
  end
end
