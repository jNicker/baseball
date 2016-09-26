class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :runs_count, default: 0
      t.timestamps
    end
  end
end
