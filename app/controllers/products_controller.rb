class ProductsController < ApplicationController
  before_action :admin_user, only: [:create, :destroy]
  
  def index
    #@products = Product.all
    #ransack
    #@q = Product.search(params[:q])
    #@products = @q.result(distinct: true)
    @products = Product.paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @product = Product.find(params[:id])
    @owner = Owner.find(1)
    @products = @owner.products
  end
  def new
    @product = Product.new
  end
  def create
    @owner = Owner.find_by(id: params[:product][:owner])
    #@owner = Owner.find_by(id: product_params_owner)
    @product = @owner.products.build(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  private
    def product_params
      params.require(:product).permit(:name,:content,:price,:picture)
    end
    
    #def product_params_owner
    #  params.require(:product).permit(:owner)
    #end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
