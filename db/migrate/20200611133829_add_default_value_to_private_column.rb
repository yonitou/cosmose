class AddDefaultValueToPrivateColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :blocks, :private, :boolean, default: false
  end
end
