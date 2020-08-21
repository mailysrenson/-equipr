class ReviewsController < ApplicationController

  def index
    @equipment = Equipment.find(params[:equipment_id])
    @review = @equipment.reviews
  end

  def create
    @equipment = Equipment.find(params[:equipment_id])
    @review = Review.new(review_params)
    @review.equipment = @equipment
   @review.save!
      redirect_to equipment_path(@equipment)
#    else
#      render 'equipment/show'
#    end
  end

  def destroy
    @review = review.find(params[:equipment_id])
    @review.destroy
    redirect_to equipment_path(@equipment)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
