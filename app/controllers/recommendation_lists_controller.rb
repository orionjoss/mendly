class RecommendationListsController < ApplicationController
  def create
    @recommendation_list = ListRecommendation.new(recommendation_id: params[:recommendation_id],
                                                  list_id: params[:list_id])

    if @recommendation_list.save
      redirect_to list_path(params[:list_id])
    else
      render "recommendations/show", status: :unprocessable_entity, alert: "Something went wrong, please try again..."
    end
  end
end
