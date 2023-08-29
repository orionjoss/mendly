class UsersController < ApplicationControllergi
  def show
    @user = User.find(params[:id])
  end
end
