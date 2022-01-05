class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :type
      t.text :description
      t.integer :temp
      t.integer :brew_time

      t.timestamps
    end
  end
end
