class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    render json: @projects, status: 200
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(project_params[:id])
    if @project.update(project_params[:project])
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(project_params[:id])
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:id, :name, :privacy)
  end
end
