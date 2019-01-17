class CreateFields < ActiveRecord::Migration[5.2]
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :number
      t.references :location, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
