class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :club, foreign_key: true
      t.references :league, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
