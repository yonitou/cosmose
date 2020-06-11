class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
  end

  def explorer
  end

  def portfolio
    @projects = Project.find(params[user_id: current_user])
  end
end
