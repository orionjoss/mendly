class RecommendationsController < ApplicationController
  def show
    @recommendation = Recommendation.find(params[:id])
  end

  
end
