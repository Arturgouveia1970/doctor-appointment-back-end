class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: { status: 'Success', message: 'loaded doctors', doctors: @doctors }, status: :ok
  end

  def show
    @doctor = Doctor.includes(:appointments).find(params[:id])
    @appointments = @doctor.appointments.order(created_at: :desc)
    render json: { status: 'Success', message: 'loaded doctor', doctor: @doctor, appointments: @appointments },
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
    params.require(:doctor).permit(:name, :speciality, :email, :location, :image_url, :user_id)
  end
end
