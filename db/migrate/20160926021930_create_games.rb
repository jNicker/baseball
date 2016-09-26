class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :home_team
      t.references :away_team
      t.timestamps
    end
  end
end
