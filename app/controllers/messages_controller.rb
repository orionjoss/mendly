class MessagesController < ApplicationController
  def create

    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.recommendation_id = nil
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end


# Generate a response using ChatGPT
# gpt_response = generate_gpt_response(@message.content)

# if gpt_response.present?
#   @message.gpt_response = gpt_response
# end

# if @message.save
#   redirect_to chatroom_path(@chatroom)
# else
#   render "chatrooms/show", status: :unprocessable_entity
# end

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
