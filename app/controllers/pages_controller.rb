class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @recommendations = Recommendation.all[0..20]
    @lists = List.all
  end

end
