class ProjectsController < ApplicationController

before_filter :authenticate, except: [:index]

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
    @project = Project.find(params[:id])
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.require(:project).permit(:id, :name, :description, :due_date, :privacy)
  end
end
