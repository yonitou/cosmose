class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :categories, array: true, :default => []
      t.string :address
      t.boolean :open_to_collab, default: true
      t.boolean :finished, default: false
      t.references :users
      t.timestamps
    end
  end
end
