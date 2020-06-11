class DropNotificationRooms < ActiveRecord::Migration[6.0]
  def change
    drop_table :notificationrooms
    drop_table :web_notifications
  end
end
