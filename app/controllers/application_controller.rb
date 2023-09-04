class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def chatbot
    client = ChatGPT4Client.new
    @text = client.chatbot(params[:prompt], params[:length])
    render json: { text: @text }
    end

end
