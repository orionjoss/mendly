class RecommendationsController < ApplicationController
  def show
    @recommendation = Recommendation.find(params[:id])
    @lists = current_user.lists
    list_url = ["https://res.cloudinary.com/div6oduuz/image/upload/v1694185616/card-martian_m82ana.jpg", "https://res.cloudinary.com/div6oduuz/image/upload/v1694185616/card-woman_iueqv7.jpg"]
    @image = list_url.sample
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.receiver = current_user
    # @recommendation.user = recommendation.receiver
    # @recommendation.item = Item.find(params[:recommendation_id, :item_id])

    if @recommendation.save
      redirect_to recommendation_path(@recommendation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update(recommendation_params)
      redirect_to recommendation_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    redirect_to home_path
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:item_id, :comment, :giver_id, :receiver_id)
  end
end
