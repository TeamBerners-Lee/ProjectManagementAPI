class UsersController < ApplicationController

  before_filter :authenticate, only: [:index]

  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: user.token }
    else
      head :unauthorized
    end
  end

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if user.save
      render json: {token: @user.token}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(user_params[:id])
    if @user.update(user_params[:user])
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :password_digest, :title, :avatar, :token)
  end
end
