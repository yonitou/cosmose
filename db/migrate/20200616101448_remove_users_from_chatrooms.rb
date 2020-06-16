class RemoveUsersFromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chatrooms, :user
  end
end
