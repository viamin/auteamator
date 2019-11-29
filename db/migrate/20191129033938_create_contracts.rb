class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :player, foreign_key: true
      t.references :club, foreign_key: true
      t.integer :status
      t.datetime :first_active
      t.datetime :last_active

      t.timestamps
    end
  end
end
