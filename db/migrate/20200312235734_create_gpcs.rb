class CreateGpcs < ActiveRecord::Migration[6.0]
    def change
      create_table :gpcs do |t|
        t.references :champion, null: false, foreign_key: true
        t.references :game, null: false, foreign_key: true
        t.references :summoner, null: false, foreign_key: true

        t.timestamps
      end
    end
  end
  