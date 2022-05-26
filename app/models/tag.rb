class Tag < ApplicationRecord
  has_many :dwarf_tags, dependent: :destroy
  has_many :dwarfs, through: :dwarf_tags
end
