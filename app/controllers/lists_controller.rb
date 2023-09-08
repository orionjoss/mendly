class ListsController < ApplicationController
  def show
    flash.now[:notice] = "List successfully shared!" if params[:check].present?
    @list = List.find(params[:id])
    @recommendations = @list.recommendations
    @all_recommendations = Recommendation.last(15)
    @list_recommendations = ListRecommendation.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to home_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
