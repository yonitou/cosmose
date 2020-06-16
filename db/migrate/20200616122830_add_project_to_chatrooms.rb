class AddProjectToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :project, foreign_key: true
  end
end
