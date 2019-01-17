class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :title
      t.datetime :starts
      t.datetime :ends
      t.references :league

      t.timestamps
    end
  end
end
