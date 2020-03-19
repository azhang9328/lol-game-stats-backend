class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :season
      t.string :queue
      t.bigint :riot_id
      t.string :gameVersion
      t.string :region
      t.integer :gameDuration
      t.integer :champion_bans, array: true, default: []
      t.string :winner

      t.timestamps
    end
  end
end
