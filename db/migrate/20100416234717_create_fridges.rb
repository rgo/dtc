class CreateFridges < ActiveRecord::Migration
  def self.up
    create_table :fridges do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.string :efficiency
      t.decimal :consume
      t.integer :height
      t.integer :width
      t.integer :deep
      t.boolean :froost

      t.timestamps
    end
  end

  def self.down
    drop_table :fridges
  end
end
