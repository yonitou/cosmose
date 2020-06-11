class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notifications

  def index
  end

  private

  def set_notifications
    @notifications = Notification.where(user_id: current_user.id)
  end

end
