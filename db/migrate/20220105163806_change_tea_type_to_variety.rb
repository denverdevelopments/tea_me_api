class ChangeTeaTypeToVariety < ActiveRecord::Migration[5.2]
  def change
    rename_column :teas, :type, :variety
  end
end
