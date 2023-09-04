class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @recommendations = Recommendation.all
    @lists = List.all
    @categories = Category.all
    @givers = User.where.not(id: current_user.id)
  end

  def chat
    # when user clicks on "message"
    # chat page opens
    # chat will have "pinned message" - ask user "what do you want to do"
    # user write message with "new recommendation"
    # chatbot sends message saying "recommendation added successfully"
  end


end
