class Admin::CategoriesController < ApplicationController

  include HttpAuthConcern
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :category], notice: 'Category deleted'
  end

  private

  def category_params
    params.require(:category).permit(
    :name,
    :created_at,
    :updated_at
    )
  end
end
