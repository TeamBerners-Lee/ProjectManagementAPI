class ProjectMembershipController < ApplicationController

  def index
    @project_membership = ProjectMembership.all
    render json: @project_memberships
  end

  def show
    @project_membership = ProjectMembership.find(params[:id])
    render json: @project_membership
  end

  def create
    @project_membership = ProjectMembership.new(group_params)
    if group.save
      render json: @project_membership, status: :created, location: @project_membership
    else
      render json: @project_membership.errors, status: :unprocessable_entity
    end
  end

  def update
    @project_membership = ProjectMembership.find(group_membership_params[:id])
    if @project_membership.update(group_params[:group])
    else
      render json: @project_membership.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_membership = ProjectMembership.find(group_params[:id])
    @project_membership.destroy
  end

  private

  def project_membership_params
    params.require(:project_membership).permit(:role)
