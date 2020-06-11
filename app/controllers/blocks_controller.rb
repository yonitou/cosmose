class BlocksController < ApplicationController
  
  def create
    @block = Block.new(block_params)
    @block.user = current_user
    if params[:project_id]
      @block.project_id = params[:project_id]
      @block.user = current_user
    end
    if @block.save && @block.project_id
      redirect_to project_path(@block.project_id)
    end
  end

  def destroy
  end

  private

  def block_params
    params.require(:block).permit(:content, :url, :private, :project_id, :photo)
  end

end
