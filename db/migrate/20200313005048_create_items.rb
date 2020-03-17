class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :riot_id
      t.string :colloq
      t.string :description
      t.string :plaintext
      t.integer :stacks
      t.string :from, array: true, default: []
      t.string :into, array: true, default: []
      t.jsonb :image
      t.jsonb :gold
      t.string :tags, array: true, default: []
      # t.string :maps
      t.jsonb :stats
      t.jsonb :effect
      # t.integer :specialRecipe
      # t.boolean :hideFromAll
      t.boolean :inStore
      # t.boolean :consumed
      # t.boolean :consumeOnFull
      t.string :requiredChampion
      t.string :requiredAlly
      t.integer :depth

      t.timestamps
    end
  end
end
