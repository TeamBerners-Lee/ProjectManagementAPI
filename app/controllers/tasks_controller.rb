class TasksController < ApplicationController

  before_filter :authenticate, only: [:create, :update, :destroy]

  def index
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @tasks = @project.tasks
      render json: @tasks, status: 200
    else
      @tasks = Task.all
      render json: @tasks, status: :ok
    end
   end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @project.tasks << @project
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private
  def task_params
    params.require(:task).permit(:id, :name, :due_date, :status, :priority, :order, :privacy)
  end
end
