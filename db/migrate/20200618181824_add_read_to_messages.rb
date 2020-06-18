class AddReadToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :read, :boolean, default: false
  end
end
