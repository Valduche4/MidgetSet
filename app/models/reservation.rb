class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :dwarf
  validates :start_time, presence: true
  validates :end_time, presence: true
end
