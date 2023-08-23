class Admin::ProjectsController < ApplicationController
    layout 'application'
    
        def index
          @projects = Project.all
        end
      
        def new
          @project = Project.new
        end
      
        def create
          @project = Project.new(project_params)
          if @project.save
            redirect_to admin_projects_path , notice: 'Project has successfully created'
          else
            render :new
          end
        end
      
        def show
            @project = Project.find(params[:id])
        end
           
        def edit
            @project = Project.find(params[:id])
        end

        def update
          @project = Project.find(params[:id])
          if @project.update(project_params)
            redirect_to admin_project_path(@project), notice: 'Project has successfully updated'
          else
            render :edit
          end
        end 
      
        def destroy
          @project = Project.find(params[:id])
          @project.destroy
          redirect_to admin_projects_path, notice: 'Project has successfully deleted.'
        end
        
      
        private
      
        def project_params
          params.require(:project).permit(:name, :status)
        end
  end