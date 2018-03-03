class ReviewsController < ApplicationController

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_form_params)
    # @review.product_id = Product.find_by(params[:id])
    @review.product_id = @product.id
    @review.user = current_user
    @review.save
    @review.errors.messages
    puts '-----------------------------------------------'
    puts review_form_params
    if @review.save
      redirect_to '/'
    else
      redirect_to :back
    end
  end

  # private
 def review_form_params
   params.require(:review).permit(:description, :rating)
 end


end
