class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @display_chatroom_id = params[:chatroom_id] || Chatroom.first.id
  end

end
