class CreateGpcsSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :gpcs_spells do |t|
      t.references :gpc, null: false, foreign_key: true
      t.references :spell, null: false, foreign_key: true
    end
  end
end
