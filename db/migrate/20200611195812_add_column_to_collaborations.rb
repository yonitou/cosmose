class AddColumnToCollaborations < ActiveRecord::Migration[6.0]
  def change
    add_column :collaborations, :status, :boolean, default: nil
    add_column :collaborations, :request_message, :text
  end
end
