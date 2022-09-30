class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_upate_parameters, if: :devise_controller? 
  
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
  
  private
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    def configure_account_upate_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
