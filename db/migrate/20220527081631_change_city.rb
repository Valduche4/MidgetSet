class ChangeCity < ActiveRecord::Migration[6.1]
  def change
    rename_column :dwarves, :city, :address
  end
end
