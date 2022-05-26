class DwarfTag < ApplicationRecord
  belongs_to :dwarf
  belongs_to :tag

  validates :tag, uniqueness: {scope: :dwarf, message: "already added"}
end
