class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def create
    @establishment = Establishment.find(params[:establishment_id])
    @review = @establishment.reviews.create(params[:review].permit(:comment, :rating))
    redirect_to establishment_path(@establishment)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
