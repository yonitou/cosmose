class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :competences, :string
  end
end
