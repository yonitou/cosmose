class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @blocks = @user.blocks.where(project_id: nil)
    @block = Block.new
  end

end
