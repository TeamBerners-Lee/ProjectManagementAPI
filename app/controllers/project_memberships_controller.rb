class ProjectMembershipsController < ApplicationController

# before_filter :authenticate

  def index
    @project_membership = ProjectMembership.all
    render json: @project_memberships
  end

  def show_users
    # @project_membership = ProjectMembership.find(params[:user_id])
    @project_membership = ProjectMembership.where project_id: (params[:project_id])
    render json: @project_membership
  end

  def show_projects
    @project_membership = ProjectMembership.find(params[:user_id])
    render json: @project_membership
  end

  def create
    @project_membership = ProjectMembership.new(project_membership_params)
    if @project_membership.save
      render json: @project_membership, status: :created, location: @project_membership
    else
      render json: @project_membership.errors, status: :unprocessable_entity
    end
  end

  def update
    @project_membership = ProjectMembership.find(project_membership_params[:id])
    if @project_membership.update(project_params[:project])
    render json: @project_membership, status: :ok
    else
      render json: @project_membership.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_membership = ProjectMembership.find(project_params[:id])
    @project_membership.destroy
    head :no_content
  end

  private

  def project_membership_params
    params.require(:project_membership).permit(:role, :user_id, :project_id)
  end
end
