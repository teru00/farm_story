class ProductsController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:name,:content,:price)
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
