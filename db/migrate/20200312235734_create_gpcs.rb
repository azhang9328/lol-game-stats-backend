class CreateGpcs < ActiveRecord::Migration[6.0]
    def change
      create_table :gpcs do |t|
        t.integer :champion_id
        t.integer :game_id
        t.integer :player_id
        t.timestamps
      end
    end
  end
  