class AddUrlsToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :football_associations, :url, :string
    add_column :leagues, :url, :string
    add_column :seasons, :url, :string
    add_column :teams, :url, :string
  end
end
