class CollaborationsController < ApplicationController
  def create
    @collaboration = Collaboration.new(collaboration_params)
    @project = Project.find(params[:project_id])
    @collaboration.user = current_user
    @collaboration.project = @project
    if @collaboration.save
      flash[:notice] = 'Demande envoyée !'
      redirect_to project_path(@project)
    else
      flash[:alert] = "Problème lors de l'envoi de la demande"
      redirect_to offer_path(@offer)
    end
  end

  def accept
    @collaboration = Collaboration.find(params[:id])
    @project = Project.find(params[:project_id])
      if @collaboration.status
        redirect_to project_path(@project)
    else
      @collaboration.status = true
      @collaboration.save
      redirect_to project_path(@project)
    end
  end

  def decline

    @collaboration = Collaboration.find(params[:id])
    @collaboration.status = false
    @collaboration.save
    redirect_to portfolio_path
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])
    @collaboration.destroy
    flash[:notice] = 'Demande supprimée !'
    redirect_to :portfolio
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:request_content, :status)
  end

end
