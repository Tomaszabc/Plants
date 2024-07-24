class WaterRemindersController < ApplicationController
  def new
    @watering_reminder = WateringReminder.new
  end

  def create
    @watering_reminder = WateringReminder.new(watering_reminder_params)
    @watering_reminder.calculate_frequency
    if @watering_reminder.save
      redirect_to @watering_reminder, notice: 'Przypomnienie utworzone'
    else
      render :new
    end
  end

  private

  def watering_reminder_params
    params.require(:watering_reminder).permit(:quantity, :unit)
  end
end
