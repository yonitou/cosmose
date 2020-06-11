class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.text :content
      t.boolean :private
      t.string :url
      t.integer :project_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
