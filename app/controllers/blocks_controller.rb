class BlocksController < ApplicationController
  def create
    @block = Block.new(block_params)
    authorize(@block)
    @block.user = current_user
    upload = params[:block][:upload]
    if upload 
      if params[:block][:upload].content_type.include?('audio')
        @block.url = Cloudinary::Uploader.upload(
          params[:block][:upload].tempfile, 
          :resource_type => :video
          )['url']
      else 
        @block.upload.attach(
          io: File.open(params[:block][:upload].tempfile),
          filename: params[:block][:upload].original_filename)
      end
    else check_if_yt
    end
    if params[:project_id]
      @block.project_id = params[:project_id]
    end
    if @block.save
      redirect_to request.referer
    end
  end

  def destroy
    @block = Block.find(params[:id])
    authorize(@block)
    @block.destroy
    redirect_to request.referer
  end

  private

  def block_params
    params.require(:block).permit(:content, :url, :private, :project_id)
  end

  def check_if_yt
    if @block.content.include?("youtu")
      regex = %r{(?:youtube(?:-nocookie)?\.com/(?:[^/\n\s]+/\S+/|(?:v|e(?:mbed)?)/|\S*?[?&]v=)|youtu\.be/)([a-zA-Z0-9_-]{11})}
      match = regex.match(@block.content)
      id = match[1] if match && !match[1].blank?
      @block.content = "<lite-youtube videoid=#{id}></lite-youtube>"
    elsif @block.content.size < 50 
      @block.content = "<center><h4 class='block_headline'>#{@block.content}/h4></center>"
    elsif @block.content == 0 
      @block.content = ""
    else "<center><p class='lead'>#{@block.content}</p></center>"
    end
  end
  
end
