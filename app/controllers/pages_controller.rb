class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
  end

  def explorer
    @projects = Project.all.geocoded
    @users = User.all.geocoded
  end

  def portfolio
    @projects = current_user.projects
    @blocks = current_user.blocks.where(project_id: nil)
  end
end
