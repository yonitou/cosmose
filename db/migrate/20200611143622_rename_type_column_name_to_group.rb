class RenameTypeColumnNameToGroup < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :type, :group
  end
end
