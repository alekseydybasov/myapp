class Admin::ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

    def new
      @project=Project.new
    end

    def create
      #render plain: params[:posts].inspect
      @project=Project.new(project_params)
      if(@project.save) #если пост может сохраниться то редирект на страницу поста
      redirect_to @project, success: 'Проект успешно добавлен!'
      else
        flash.now[:danger] = 'Ошибка добавления'
        render 'new' #перезагрузка страницы
      end
    end

    def edit
      @project=Project.find(params[:id])
    end

    def update
      @project=Project.find(params[:id])
      if(@project.update(project_params))
        redirect_to @project, success: 'Проект успешно обновлен!'
      else
        flash.now[:danger] = 'Ошибка обновления'
        render "edit"
      end
    end

    def destroy
      @project=Project.find(params[:id])
      @project.destroy
      redirect_to projects_path, success: 'Проект успешно удален!'
    end

    private def project_params
      params.require(:project).permit(:name, :summary, :start_date, :end_date) # из какой формы и какие поля разрешены
    end
end
