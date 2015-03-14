class ProjectMembershipController < ApplicationController

before_filter :authenticate, only: [:create, :update, :destroy]

  def index
    @project_membership = ProjectMembership.all
    render json: @project_memberships
  end

  def show
    @project_membership = ProjectMembership.find(params[:id])
    render json: @project_membership
  end

  def create
    @project_membership = ProjectMembership.new(project_params)
    if group.save
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
    params.require(:project_membership).permit(:role)
  end
end
