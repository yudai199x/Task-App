class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :authenticate_user!
  before_action :admin_user, only: [:index, :destroy]
  before_action :admin_or_correct, only: :show
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
end
