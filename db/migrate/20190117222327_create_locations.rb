class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :map
      t.string :name
      t.boolean :all_weather
      t.integer :fields_count, null: false, default: 0
      t.boolean :lights

      t.timestamps
    end
  end
end
