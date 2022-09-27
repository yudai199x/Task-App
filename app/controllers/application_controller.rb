class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseHelper
  include TasksHelper
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def admin_or_correct
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end
  end
end
