class RemoveColumnsFromNotifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :group
    remove_column :notifications, :request_status
  end
end
