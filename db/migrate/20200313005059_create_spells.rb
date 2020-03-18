class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.references :champion
      t.string :name
      t.string :riot_id
      t.string :description
      t.string :tooltip
      t.integer :maxrank
      t.integer :cooldown, array: true, default: []
      t.integer :cost, array: true, default: []
      t.jsonb :effect
      t.jsonb :vars
      t.string :costType
      t.integer :range, array: true, default: []
      t.jsonb :image
      t.string :resource

      t.timestamps
    end
  end
end
