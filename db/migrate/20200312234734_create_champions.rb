class CreateChampions < ActiveRecord::Migration[6.0]
  def change
    create_table :champions do |t|
      t.string :name
      t.integer :riot_id
      t.string :title
      t.jsonb :image
      t.string :skins, array: true, default: []
      t.string :lore
      t.string :blurb
      t.string :allytips, array: true, default: []
      t.string :enemytips, array: true, default: []
      t.string :tags, array: true, default: []
      t.string :partype
      t.jsonb :info
      t.jsonb :stats

      t.timestamps
    end
  end
end
