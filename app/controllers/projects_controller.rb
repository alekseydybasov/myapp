class ProjectsController < ApplicationController

    def index
      @project=Project.all
    end

    def show
      @project=Project.find(params[:id])
      @task=@project.tasks    
    end

end
