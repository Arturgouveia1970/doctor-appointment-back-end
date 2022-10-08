class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: { status: 'Success', message: 'loaded doctors', doctors: @doctors }, status: :ok
  end

  def show
    @doctor = Doctor.includes(:reservations).find(params[:id])
    @reservations = @doctor.reservations.order(created_at: :desc)
    render json: { status: 'Success', message: 'loaded doctor', doctor: @doctor, reservations: @reservations },
           status: :ok
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: {
        message: 'Doctor added successfully'
      }, status: :created
    else
      render json: {
        message: 'something went wrong'
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy
      render json: { message: 'Doctor deleted succesfully.' }
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      render json: { message: 'Doctor updated succesfully.' }
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :price, :description, :country, :city, :address, :image_url)
  end
end
