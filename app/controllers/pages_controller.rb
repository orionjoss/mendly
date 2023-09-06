class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    if params[:query].present?
      @recommendations = Recommendation.global_search(params[:query])
    else
      @recommendations = Recommendation.all
    end
    @lists = List.all
    @categories = Category.all
    @givers = User.where.not(id: current_user.id)
  end
end
