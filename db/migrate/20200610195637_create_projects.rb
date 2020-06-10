class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.title :string
      t.description :text
      t.categories :string, array: true, :default => []
      t.address :string
      t.open_to_collab :boolean, default: true
      t.finished :boolean, default: false
      t.references :users
      t.timestamps
    end
  end
end
