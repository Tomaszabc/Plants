class WateringLogsController < ApplicationController

  def create
    @plant = Plant.find(params[:plant_id])
    @watering_log = @plant.watering_logs.build(watering_log_params)

    if @watering_log.save
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