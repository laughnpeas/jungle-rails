class ReviewsController < ApplicationController
  before_filter :authorize


  def create
    product = Product.find(params[:product_id])
    review  = product.reviews.create(review_params)
    review.user = current_user
    if review.save
      redirect_to product, notice: 'Review was successfully created.'
    else
      redirect_to product, notice: 'Faild to write a review.'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to product_url(@review.product), notice: 'Review was successfully destroyed.' }
    end
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def authorize
      unless current_user
        flash[:error] = 'You need to login to write a review'
        redirect_to :login_url
      end
    end
    
end
