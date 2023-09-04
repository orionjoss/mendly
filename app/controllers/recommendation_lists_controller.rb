class RecommendationListsController < ApplicationController
  def create
    @recommendation_list = ListRecommendation.new(recommendation_id: params[:recommendation_id], list_id: params[:list_id])

    if @recommendation_list.save
      redirect_to list_path(params[:list_id])
    else
      render "recommendations/show", status: :unprocessable_entity, alert: "Something went wrong, please try again..."
    end
  end

  def destroy
    raise
    @recommendation_list = ListRecommendation.find(params[:recommendation_list_id])
    @recommendation_list.destroy
    redirect_to list_path(@list)
  end

  private

  def recommendation_list_params
    params.require(:list_recommendations).permit(:recommendation_id,:list_id, :list_recommendation_id)
  end
end
