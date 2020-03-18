class CreateGpcsRunes < ActiveRecord::Migration[6.0]
  def change
    create_table :gpcs_runes do |t|
      t.references :gpc, null: false, foreign_key: true
      t.references :rune, null: false, foreign_key: true

      t.timestamps
    end
  end
end
