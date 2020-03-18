class CreatePassives < ActiveRecord::Migration[6.0]
  def change
    create_table :passives do |t|
      t.string :name
      t.string :description
      t.jsonb :image
      t.references :champion
      
      t.timestamps
    end
  end
end
