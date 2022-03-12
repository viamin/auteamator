class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    enable_extension("citext")

    create_table :players do |t|
      t.citext :email
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :positions
      t.references :club

      t.timestamps
    end
  end
end
