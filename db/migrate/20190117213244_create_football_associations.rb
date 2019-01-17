class CreateFootballAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :football_associations do |t|
      t.string :name

      t.timestamps
    end

    safety_assured do
      change_table :clubs do |t|
        t.references :football_association
      end
    end
  end
end
