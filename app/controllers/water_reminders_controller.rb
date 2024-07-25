class WaterRemindersController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @watering_reminder = WateringReminder.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @watering_reminder = @plant.build_watering_reminder(watering_reminder_params)
    @watering_reminder.calculate_frequency
    if @watering_reminder.save
      redirect_to @plant, notice: 'Przypomnienie utworzone'
    else
      render :new
    end
  end

  private

  def watering_reminder_params
    params.require(:watering_reminder).permit(:quantity, :unit)
  end
end
