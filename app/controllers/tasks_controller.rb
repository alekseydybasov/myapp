class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    @project=Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project=Project.find(params[:project_id])
    @task=@project.tasks.build(task_params)
    if(@task.save)
      redirect_to project_path(@project), success: 'Задача успешно добавлена!'
    else
      flash.now[:danger] = 'Ошибка добавления'
      render 'new'
    end
  end

  def edit
    @project=Project.find(params[:project_id])
    @task=Task.find(params[:id])
  end

  def update
    @project=Project.find(params[:project_id])
    @task=Task.find(params[:id])
    if(@task.update(task_params))
      redirect_to project_path(@project), success: 'Задача успешно обновлена!'
    else
      flash.now[:danger] = 'Ошибка обновления'
      render 'edit'
    end
  end

  def destroy
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project), success: 'Задача успешно удалена!'
  end


  private  def task_params
    params.require(:task).permit(:title, :description,:status, :user_id)
  end
end
