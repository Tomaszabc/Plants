class Plant < ApplicationRecord
  belongs_to :user
  has_many :watering_dates, dependent: :destroy
end
