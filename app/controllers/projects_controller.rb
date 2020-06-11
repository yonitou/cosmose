class ProjectsController < ApplicationController
  before_action :set_project, except: %i[index new create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:notice] = 'Projet créé !'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Erreur lors de la création'
      render :new
    end
  end

  def edit; end

  def update
    @project.update(project_params)
    flash[:notice] = 'Projet mis à jour !'
    redirect_to project_path(@project)
  end

  def show; end

  def destroy
    @project.destroy
    flash[:notice] = 'Projet supprimé !'
    redirect_to '/explorer'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :address, :open_to_collab, :finished, categories: [])
  end
end

