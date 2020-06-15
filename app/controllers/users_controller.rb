class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @users = User.all
    if params[:query].present?
      sql_query = "username ILIKE :query OR bio ILIKE :query"
      @users = policy_scope(User).geocoded.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = policy_scope(User).geocode
    end
    @users = @users.where("competences ILIKE ?", "%#{params[:competences]}%") if params[:competences].present?

    if params[:address].present?
      @users = @users.near(params[:address], 10)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
