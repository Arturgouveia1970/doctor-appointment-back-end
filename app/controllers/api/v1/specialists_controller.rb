class Api::V1::SpecialistsController < ApplicationController
  before_action :set_speciality, only: %i[show update destroy]
  # before_action :authenticate_user

  # GET /specialists
  def index
    @specialists = speciality.all

    render json: specialists
  end

  # GET /specialists/1
  def show
    render json: @speciality
  end

  # POST /specialists
  def create
    @speciality = speciality.new(speciality_params)

    if @speciality.save
      render json: @speciality, status: :created, location: @speciality
    else
      render json: @speciality.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specialists/1
  def update
    if @speciality.update(speciality_params)
      render json: @speciality
    else
      render json: @speciality.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specialists/1
  def destroy
    @speciality.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_speciality
    @speciality = speciality.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def speciality_params
    params.require(:speciality).permit(:name, :description, :rating)
  end
end
