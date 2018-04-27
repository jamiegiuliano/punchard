class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :merchant_id

      t.timestamps
    end
  end
end
