class RemoveNotificationroomFromNotification < ActiveRecord::Migration[6.0]
  def change
    remove_reference :notifications, :notificationroom
  end
end
