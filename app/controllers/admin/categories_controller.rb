class Admin::CategoriesController < ApplicationController

  # this should be cleaned up using a module


  http_basic_authenticate_with name: "Jungle", password: "book"

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :newend
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end
