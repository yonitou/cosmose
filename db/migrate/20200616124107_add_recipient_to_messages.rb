class AddRecipientToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference(:messages, :recipient, foreign_key: {to_table: :users})
  end
end
