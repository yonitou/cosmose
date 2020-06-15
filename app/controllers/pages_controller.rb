class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
  end

  def explorer
    @projects = policy_scope(Project).geocoded
    @users = User.all.geocoded
    @display_project = false
    if params[:query].present?
      sql_query = "username ILIKE :query OR bio ILIKE :query"
      @users = @users.where(sql_query, query: "%#{params[:query]}%")
    end
    @users = @users.where("competences ILIKE ?", "%#{params[:competences]}%") if params[:competences].present?

    if params[:address].present?
      @users = @users.near(params[:address], 10)
    end

    if params[:query_project].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @projects = @projects.where(sql_query, query: "%#{params[:query_project]}%")
      @display_project = true
    end
    @projects = @projects.where("category ILIKE ?", "%#{params[:categories]}%") if params[:categories].present?

    if params[:address].present?
      @projects = @projects.near(params[:address], 10)
    end

  end

  def portfolio
    @projects = current_user.projects
    @blocks = current_user.blocks.where(project_id: nil)
  end
end
