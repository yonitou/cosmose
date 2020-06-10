class ChangeColumnOfProjects < ActiveRecord::Migration[6.0]
  def change
    remove_reference :projects, :users
    add_reference :projects, :user
  end
end
