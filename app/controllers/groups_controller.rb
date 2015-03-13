class GroupsController < ApplicationController

  def index
    @groups = Group.all
    render json: @groups, status: 200
  end

  def show
    @group = Group.find(params[:id])
    render json: @group
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def update
    @group = Group.find(group_params[:id])
    if @group.update(group_params[:group])
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(group_params[:id])
    @group.destroy
  end

  private

  def group_params
    params.require(:group).permit(:id, :name, :privacy)
  end
end
