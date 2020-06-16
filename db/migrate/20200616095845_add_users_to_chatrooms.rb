class AddUsersToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :user,foreign_key: true
  end
end
