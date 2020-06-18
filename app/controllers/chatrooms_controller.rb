class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @display_chatroom_id = params[:chatroom_id] || Chatroom.first.id
    @chatrooms.each do |chatroom|
      chatroom.messages.each do |message|

        message.read = true if message.user != current_user
        message.save
      end
    end
  end
end
