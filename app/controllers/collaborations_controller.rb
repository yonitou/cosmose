class CollaborationsController < ApplicationController
  before_action :set_project

  def create
    @collaboration = Collaboration.new(collaboration_params)
    @collaboration.user = current_user
    @collaboration.project = @project
    authorize(@collaboration)
    if @collaboration.save
      notification = Notification.new(content: "<li class='request-collaboration-notification'><i class='far fa-user'></i>#{current_user.username} souhaite collaborer avec vous sur : #{@project.title}</li>")
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
      redirect_to project_path(@project)
    end
  end

  def decline
    @collaboration = Collaboration.find(params[:id])
    @collaboration.status = false
    authorize(@collaboration)
    @collaboration.save
    redirect_to project_path(@project)
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])
    authorize(@collaboration)
    @collaboration.destroy
    flash[:notice] = 'Demande supprimée !'
    redirect_to :portfolio
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:request_content, :status)
  end


  def set_project
    @project = Project.find(params[:project_id])
  end
end
