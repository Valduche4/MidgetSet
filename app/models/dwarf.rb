class Dwarf < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :job_dwarfs, dependent: :destroy
  has_many :jobs, through: :job_dwarfs
  SEXES = %w[male female non-binary]
  validates :name, presence: true
  validates :sexe, presence: true, inclusion: { in: SEXES }
  validates :origin, presence: true
  validates :age, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :city, presence: true
end
