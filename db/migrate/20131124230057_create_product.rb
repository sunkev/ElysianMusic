class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :brand,        null: false
      t.string   :model,        null: false
      t.text     :description
      t.decimal  :price,        null: false, precision: 7, scale: 2
    end
  end
end
