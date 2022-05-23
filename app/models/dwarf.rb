class Dwarf < ApplicationRecord
  belongs_to :user
  SEXES = %w[male female no-binary]
  validates :name, presence: true
  validates :sexe, presence: true, inclusion: { in: SEXES }
  validates :origin, presence: true
  validates :age, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :city, presence: true
end
