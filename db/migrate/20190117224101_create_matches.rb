class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :kickoff
      t.jsonb :result
      t.references :field, foreign_key: true
      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :season, foreign_key: true
      t.references :visiting_team, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
