class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :validation, default: false
      t.references :user, null: false, foreign_key: true
      t.references :dwarf, null: false, foreign_key: true

      t.timestamps
    end
  end
end
