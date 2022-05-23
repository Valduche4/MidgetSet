class CreateDwarves < ActiveRecord::Migration[6.1]
  def change
    create_table :dwarves do |t|
      t.string :name
      t.string :sexe
      t.string :origin
      t.integer :age
      t.float :size
      t.text :description
      t.float :price
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
