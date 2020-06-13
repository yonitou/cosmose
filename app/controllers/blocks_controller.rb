class BlocksController < ApplicationController
  def create
    @block = Block.new(block_params)
    authorize(@block)
    @block.user = current_user
    check_if_yt
    if params[:project_id]
      @block.project_id = params[:project_id]
      @block.user = current_user
    end
    redirect_to project_path(@block.project_id) if @block.save && @block.project_id
  end

  def destroy
  end

  private

  def block_params
    params.require(:block).permit(:content, :url, :private, :project_id, :upload)
  end

  def check_if_yt
    if @block.content.include?("youtu")
      regex = %r{(?:youtube(?:-nocookie)?\.com/(?:[^/\n\s]+/\S+/|(?:v|e(?:mbed)?)/|\S*?[?&]v=)|youtu\.be/)([a-zA-Z0-9_-]{11})}
      match = regex.match(@block.content)
      id = match[1] if match && !match[1].blank?
      @block.content = "<lite-youtube videoid=#{id}></lite-youtube>"
    end
  end
end
