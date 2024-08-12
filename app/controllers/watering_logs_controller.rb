class WateringLogsController < ApplicationController
  before_action :set_plant

  def create
    if @plant.water(watering_log_params[:created_at])
      redirect_to @plant, notice: "Utworzono watering log"
    else
      render :new
    end
  end

  def destroy
    @watering_log = WateringLog.find(params[:id])
    @watering_log.destroy
    redirect_to plant_path(@plant), notice: "Log deleted"
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def watering_log_params
    params.require(:watering_log).permit(:watered_at, :notes, :created_at)
  end
end
