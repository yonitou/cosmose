class BlocksController < ApplicationController

  private

  def block_params
    params.require(:block).permit(:content, :url, :private, :project_id)
  end


end
