class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
      @tasks = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)
      
      if @task.save
          flash[:success] = 'Taskが正常に作成されました'
          redirect_to @task
      else
          flash.now[:danger] = 'Taskが作成されませんでした'
          render :new
      end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に変更されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは変更されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def task_params
      params.require(:task).permit(:content)
  end
end
