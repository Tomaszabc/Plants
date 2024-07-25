class WateringLogsController < ApplicationController

  def create
    @plant = Plant.find(params[:plant_id])
    if @plant.water(watering_log_params[:created_at])
      redirect_to @plant, notice: "Utworzono watering log"
    else
      render :new
    end
  end

  private
  
  def watering_log_params
    params.require(:watering_log).permit(:watered_at, :notes, :created_at)
  end
end