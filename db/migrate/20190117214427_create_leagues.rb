class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.references :football_association, foreign_key: true
      t.string :name
      t.integer :level
      t.boolean :relegation
      t.string :description
      t.string :day
      t.string :format
      t.string :skill_level
      t.string :age_restriction
      t.string :gender_restriction

      t.timestamps
    end
  end
end
