class CreateUserLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_likes do |t|
      t.references :user
      t.references :project
      t.timestamps
    end
  end
end
