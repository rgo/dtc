class CreateDryers < ActiveRecord::Migration
  def self.up
    create_table :dryers do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.string :efficiency
      t.decimal :consume
      t.integer :capacity
      t.decimal :consume_kg
      t.integer :height
      t.integer :width
      t.integer :deep

      t.timestamps
    end
  end

  def self.down
    drop_table :dryers
  end
end
