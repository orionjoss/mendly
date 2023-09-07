class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.recommendation_id = nil

    openai_service = OpenaiService.new(params["message"]["content"])

    gpt_response = openai_service.call

    @message.gpt_response = gpt_response if gpt_response.present?

    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end

  end


  # Generate a response using ChatGPT
  # Define a response based on a chat GPT query
  # call it
  # generate response as a message
  # check if response is not empty
  # User will ask specific queries about their own data
  # How chat GPT will access our own data?

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def generate_gpt_response(prompt)
    client = ChatGPT4Client.new
    response = client.generate_text(prompt, length)
    response.present? ? response : nil
  end
end
