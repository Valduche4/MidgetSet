class CreateJobDwarves < ActiveRecord::Migration[6.1]
  def change
    create_table :job_dwarves do |t|
      t.references :dwarf, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
