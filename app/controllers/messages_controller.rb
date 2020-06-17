class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.recipient = @chatroom.messages.first.recipient if @chatroom.members.length == 2
    if @message.save
      ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message_broadcasted", locals: { message: @message })
      )
      redirect_to chatrooms_path + "?chatroom_id=#{@chatroom.id}"
    end
  end

  def init
    receiver = User.find(params[:id])
    @chatroom = Chatroom.exists_for_users?(current_user, receiver)
    unless @chatroom
      @chatroom = Chatroom.create(name: "#{current_user.username} & #{receiver.username}")
      Message.create(content: "Bienvenue dans votre discussion avec #{current_user.username}", recipient: receiver, user: current_user, chatroom: @chatroom)
    end
    redirect_to chatrooms_path + "?chatroom_id=#{@chatroom.id}"
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
