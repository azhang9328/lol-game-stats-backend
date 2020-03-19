class CreateSummoners < ActiveRecord::Migration[6.0]
  def change
    create_table :summoners do |t|
      t.integer :profileIconId
      t.string :name
      t.string :puuid
      t.integer :summonerLevel
      t.string :accountId
      t.string :summonerId

      t.timestamps
    end
  end
end
