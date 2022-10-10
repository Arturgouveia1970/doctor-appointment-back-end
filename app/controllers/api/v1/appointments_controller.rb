class Api::V1::AppointmentsController < ApplicationController
  # GET all
  def index
    @appointments = Appointment.all
    render json: @appointments, status: :ok
  end

  # GET 1
  def show
    render json: @appointments, status: :ok
  end

  # POST
  def create
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new(appointment_params.merge(user: @user))
    if @appointment.save
      render json: @appointment, status: :ok
    else
      render json: { errors: @appointment.errors.full_message }, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render json: @appointment, status: :ok
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
      render json: { message: "#{@appointment.appointment_date} appointment deleted successfully" } if @appointment.destroy
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])

    render json: { errors: 'appointment not found' }, status: :not_found
  end

  def appointment_params
    params.permit(:appointment_date, :city, :user_id, :doctor_id, :duration)
  end
end
