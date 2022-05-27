class AddCoordinatesToDwarf < ActiveRecord::Migration[6.1]
  def change
    add_column :dwarves, :latitude, :float
    add_column :dwarves, :longitude, :float
  end
end
