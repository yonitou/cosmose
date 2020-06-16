class UserLikesController < ApplicationController
  before_action :set_project
  before_action :set_user_like, only: [:destroy]

  def create
    unless already_liked?
      @project.user_likes.create(user_id: current_user.id)
      notification = Notification.new(content: "<li class='like'><i class='fas fa-heart'></i>#{current_user.username} aime votre projet : #{@project.title}</li>")
      notification.user = @project.user
      notification.project = @project
      authorize(@project.user_likes)
      notification.save
    end
    redirect_to project_path(@project)
  end

  def destroy
    authorize(@project.user_likes)
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

  def create_notifications
    @project = Project.find(params[:project_id])
  end
end
