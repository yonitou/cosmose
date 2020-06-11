class UserLikesController < ApplicationController
  before_action :set_project
  before_action :set_user_like, only: [:destroy]

  def create
    @project.user_likes.create(user_id: current_user.id) unless already_liked?
    redirect_to project_path(@project)
  end

  def destroy
    @user_like.destroy if already_liked?
    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def already_liked?
    UserLike.where(user_id: current_user.id, project_id: params[:project_id]).exists?
  end

  def set_user_like
    @user_like = @project.user_likes.find(params[:id])
  end

end
