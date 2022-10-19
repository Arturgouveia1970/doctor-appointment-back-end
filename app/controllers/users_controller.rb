class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def register
    if User.find_by(name: params[:name].to_s.downcase)
      render json: { error: 'name already exists!' }
    else
      @user = User.new(user_params)
      @user.name = @user.name.to_s.downcase
      if @user.save
        render json: { user: @user, logged_in: true }
      else
        render json: { error: 'There was an error, please try again!' }
      end
    end
  end

  def login
    @user = User.find_by(name: params[:name].to_s.downcase)
    if @user
      render json: { user: @user, logged_in: true }
    else
      render json: { error: 'name is invalid!' }
    end
  end

  def user_doctor
    # @doctor = User.find_by(params[:id])
    @user = User.find(params[:id])
    @doctors = Doctor.where(user_id: @user)
    render json: { doctors: @doctors }, status: :ok
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
