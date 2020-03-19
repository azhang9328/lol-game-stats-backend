class CreateGpcsItems < ActiveRecord::Migration[6.0]
  def change
    create_table :gpcs_items do |t|
      t.references :gpc, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
