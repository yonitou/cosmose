class ChangeColumnOfUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :competences
    add_column :users, :competences, :string, array: true, :default => []
  end
end
