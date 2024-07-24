class WateringReminder < ApplicationRecord
attr_accessor :quantity, :unit

  def calculate_frequency
    hours = case unit
            when 'days'
              quantity.to_i * 24
            when "weeks"
              quantity.to_i * 24 * 7
            else
              0
            end
    self.frequency = hours
  end
end
