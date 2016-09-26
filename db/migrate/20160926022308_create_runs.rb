class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.references :game
      t.references :team
      t.references :player
      t.timestamps
    end
  end
end
