class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @recommendations = Recommendation.all
    @lists = List.all
    @categories = Category.all
    @givers = User.where.not(id: current_user.id)
  end

end
