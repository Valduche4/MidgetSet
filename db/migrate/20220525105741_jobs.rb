class Jobs < ActiveRecord::Migration[6.1]
  def change
    rename_column :jobs, :type, :name
    remove_column :jobs, :picture
  end
end
