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
    if params[:competences].present?
      potential_users = @users
      @users = []
      if params[:competences].class == String
        @users << potential_users.filter do |user|
          user.competences.include?(params[:competences])
        end
        @users.flatten!
      else
        params[:competences].each do |competence|
          @users << potential_users.filter do |user|
            user.competences.include?(competence)
          end
        end
        @users.flatten!
      end
    end
    if params[:address].present?
      @users = @users.near(params[:address], 10)
    end

    if params[:query_project].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @projects = @projects.where(sql_query, query: "%#{params[:query_project]}%")
      @display_project = true
    end
    if params[:category].present?
      potential_projects = @projects
      @projects = []
      if params[:category].class == String
        @projects << potential_projects.filter do |project|
          project.categories.include?(params[:category])
        end
        @projects.flatten!
      else
        params[:category].each do |category|
          @projects << potential_projects.filter do |project|
            project.categories.include?(category)
          end
        end
        @projects.flatten!
      end
    end

    if params[:address].present?
      @projects = @projects.near(params[:address], 10)
    end

  end

  def portfolio
    @projects = current_user.projects
    @blocks = current_user.blocks.where(project_id: nil)
  end
end
