class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.where(product_id: params[:id])
    @review_new = @product.reviews.new
    @review_currentuser = @product.reviews.where(user_id: current_user) 
  
  end

end
