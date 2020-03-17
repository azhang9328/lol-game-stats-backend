class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :riot_id
      t.string :description
      t.string :tooltip
      t.integer :maxrank
      t.integer :cooldown, array: true, default: []
      t.integer :cost, array: true, default: []
      t.integer :effect, array: true, default: []
      t.string :vars, array: true, default: []
      t.string :tags, array: true, default: []
      t.string :costType
      t.integer :range, array: true, default: []
      t.jsonb :image
      t.string :resource

      t.timestamps
    end
  end
end
