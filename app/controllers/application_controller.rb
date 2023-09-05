class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def generate_text
    client = ChatGPT4Client.new
    @text = client.generate_text(params[:prompt], params[:length])
    render json: { text: @text }
  end
end
