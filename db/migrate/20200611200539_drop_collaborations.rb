class DropCollaborations < ActiveRecord::Migration[6.0]
  def change
    drop_table :collaborations
  end
end
