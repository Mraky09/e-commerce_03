class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def is_admin?
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = t "wrong_authorize"
      redirect_to root_path
    end
  end
end
