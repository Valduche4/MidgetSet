class Job < ApplicationRecord
  # belongs_to :dwarf
  # has_many :dwarf_tags, dependent: :destroy
  # has_many :tags, through: :dwarf_tags
  validates :name, presence: true
end
