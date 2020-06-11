class CreateCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborations do |t|
      t.text :request_content
      t.boolean :status, default: nil
      t.references :project
      t.references :user
      t.timestamps
    end
  end
end
