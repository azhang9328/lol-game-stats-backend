class CreateSummoners < ActiveRecord::Migration[6.0]
  def change
    create_table :summoners do |t|

      t.timestamps
    end
  end
end
