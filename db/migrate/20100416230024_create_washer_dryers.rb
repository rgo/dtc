class CreateWasherDryers < ActiveRecord::Migration
  def self.up
    create_table :washer_dryers do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.integer :rpm
      t.string :efficiency
      t.decimal :consume
      t.decimal :washing_consume
      t.string :washing_efficiency
      t.integer :washing_capacity
      t.integer :drying_capacity
      t.decimal :consume_kg
      t.integer :water_consume
      t.integer :height
      t.integer :width
      t.integer :deep
      t.string :termoefficiency

      t.timestamps
    end
  end

  def self.down
    drop_table :washer_dryers
  end
end
