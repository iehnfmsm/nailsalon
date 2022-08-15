class Reservation < ApplicationRecord
  validates :date, presence: true
  validates :prefer_time_id, presence: true

  belongs_to :user
  belongs_to :prefer_time
end
