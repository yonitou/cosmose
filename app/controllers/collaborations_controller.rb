class CollaborationsController < ApplicationController
  before_action :set_project

  def create
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.user = current_user
    @collaboration.project = @project
    authorize(@collaboration)
    if @collaboration.save
      notification = Notification.new(content: "<li class='request-collaboration-notification'><i class='fas fa-user'></i>#{current_user.username} souhaite collaborer avec vous sur : #{@project.title}</li>")
      notification.user = @project.user
      notification.project = @project
      notification.save
      flash[:notice] = 'Demande envoyée !'
      redirect_to project_path(@project)
    else
      flash[:alert] = "Problème lors de l'envoi de la demande"
      redirect_to project_path(@project)
    end
  end

  def accept
    @collaboration = Collaboration.find(params[:id])

    if @collaboration.status
      redirect_to project_path(@project)
    else
      @collaboration.status = true
      authorize(@collaboration)
      @collaboration.save
      notification = Notification.new(content: "<li class='request-collaboration-notification'><i class='fas fa-user'></i>#{@project.user.username} a accepté votre demande de collaboration sur le projet : #{@project.title}</li>")
      notification.user = @collaboration.user
      notification.project = @project
      notification.save
      redirect_to project_path(@project)
    end
  end

  def decline
    @collaboration = Collaboration.find(params[:id])
    @collaboration.status = false
    authorize(@collaboration)
    @collaboration.save
    notification = Notification.new(content: "<li class='request-collaboration-notification'><i class='fas fa-user'></i>#{@project.user.username} a décliné votre demande de collaboration sur le projet : #{@project.title}</li>")
    notification.user = @collaboration.user
    notification.project = @project
    notification.save
    redirect_to project_path(@project)
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])
    authorize(@collaboration)
    @collaboration.destroy
    flash[:notice] = 'Demande supprimée !'
    redirect_to project_path(@project)
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:request_content, :status)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
