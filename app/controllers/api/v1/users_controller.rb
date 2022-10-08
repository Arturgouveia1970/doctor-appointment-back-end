class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def new; end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user
    else
      render json: @user.errors
    end
  end

  def update
    render json: @user if @user.update(params.permit)
  end

  def destroy
    render json: { message: "#{@user.name} deleted successfully" } if @user.destroy
  end

  private

  # use callback to share common setup or constraints between actions
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:name, :email, :password)
  end
end
