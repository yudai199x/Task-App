class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:show, :edit, :update, :destroy, :update_cpl]
  before_action :authenticate_user!
  before_action :correct_user
  
  def index
    @tasks = @user.tasks
  end
  
  def show
    @mini_tasks = @task.mini_tasks
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:notice] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update_attributes(task_params)
      flash[:notice] = "タスクを更新しました。"
      redirect_to user_tasks_url @user
    else
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    flash[:notice] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end
  
  def update_cpl
    cpl_params.each do |id, item|
      mini_task = @task.mini_tasks.find(id)
      mini_task.update_attributes(item)
    end
    flash[:notice] = "タスク進捗を更新しました。"
    redirect_to user_tasks_url @user
  end
  
  private
    
    def task_params
      params.require(:task).permit(:name, mini_tasks_attributes: [:id, :task_id, :dtl, :_destroy])
    end
    
    def cpl_params
      params.require(:task).permit(mini_tasks: :cpl_chk)[:mini_tasks]
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_task
      @task = @user.tasks.find_by(id: params[:id])
    end
end
