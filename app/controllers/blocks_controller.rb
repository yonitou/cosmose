class BlocksController < ApplicationController
  def create
    @block = Block.new(block_params)
    authorize(@block)
    @block.user = current_user
    check_if_yt
    if params[:project_id]
      @block.project_id = params[:project_id]
    end
    if @block.save && @block.project_id
      redirect_to project_path(@block.project_id) 
    else redirect_to request.referer
  end

  def destroy
    @block = Block.find(params[:id])
    authorize(@block)
    @block.destroy
    redirect_to request.referer
  end

  private

  def block_params
    params.require(:block).permit(:content, :url, :private, :project_id, :upload)
  end

  def upload_file(block)
    puts 'attaching file to block'
    content_type = params[:block][:upload].content_type
    if content_type.include?('audio')
      block.upload.attach(
        io: File.open(params[:block][:upload].tempfile),
        filename: params[:block][:upload].original_filename, 
        content_type: 'video'
        )
      # raise
    end
  end

  def check_if_yt
    if @block.content.include?("youtu")
      regex = %r{(?:youtube(?:-nocookie)?\.com/(?:[^/\n\s]+/\S+/|(?:v|e(?:mbed)?)/|\S*?[?&]v=)|youtu\.be/)([a-zA-Z0-9_-]{11})}
      match = regex.match(@block.content)
      id = match[1] if match && !match[1].blank?
      @block.content = "<lite-youtube videoid=#{id}></lite-youtube>"
    elsif @block.content.size < 50 
      @block.content = "<center><h4><mark>#{@block.content}</mark></h4></center>"
    else @block.content = "<center><p class='lead'>#{@block.content}</p></center>"
    end
  end
end
