class CreateRunes < ActiveRecord::Migration[6.0]
  def change
    create_table :runes do |t|
      t.integer :riot_id
      t.string :name
      t.string :icon
      t.string :shortDesc
      t.string :longDesc
      t.string :rune_type

      t.timestamps
    end
  end
end
