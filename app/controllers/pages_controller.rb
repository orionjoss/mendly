class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @recommendations = Recommendation.all[0..20]
    @lists = List.all
    @categories = Category.all
    @givers = User.where.not(id: current_user.id)
  end
end
