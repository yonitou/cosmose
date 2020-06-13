class ProjectsController < ApplicationController
  before_action :set_project, except: %i[index new create]

  def index
    @projects = policy_scope(Project)
  end

  def new
    @project = Project.new
    authorize(@project)
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize(@project)
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
    if @project.save
      flash[:notice] = 'Projet mis à jour !'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Erreur lors de la création'
      render :edit
    end
  end

  def show
    @requests = Collaboration.where(project_id: @project.id)
    @collaboration = Collaboration.new
    authorize(@project)
    @private_blocks = Block.where(project_id: @project, private: true)
    @public_blocks = Block.where(project_id: @project, private: false)
    @block = Block.new
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Projet supprimé !'
    redirect_to '/explorer'
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize(@project)
  end

  def project_params
    params.require(:project).permit(:title, :description, :address, :open_to_collab, :finished, categories: [])
  end
end
