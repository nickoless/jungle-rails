class ReviewsController < ApplicationController

  before_filter :authorize

  def create
      @product = Product.find(params[:product_id])
      @review = Review.new(review_form_params)
      @review.product_id = @product.id
      @review.user = current_user
      @review.save
      @review.errors.messages
      if @review.save
        redirect_to :back
      else
        redirect_to :back
      end
  end

  def destroy
    @review = Review.find(params[:id])
    if session[:user_id]
      @review.destroy
      redirect_to :back
    end
  end

  private
  def review_form_params
    params.require(:review).permit(:description, :rating)
  end
  
end

