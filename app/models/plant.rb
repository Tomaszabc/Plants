class Plant < ApplicationRecord
  belongs_to :user
  has_many :watering_logs, dependent: :destroy
end
