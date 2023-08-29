class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # redirect_to (chat or lista geral)
  end
end
