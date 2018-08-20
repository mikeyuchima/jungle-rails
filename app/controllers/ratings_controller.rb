class RatingsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    review = @product.ratings.new(rating_params)
    review.user_id = current_user.id if current_user


    if @product.save
      redirect_to :back, notice: 'Review created!'
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(
      :description,
      :rate
    )
  end

end
