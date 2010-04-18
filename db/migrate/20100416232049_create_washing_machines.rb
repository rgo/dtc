class CreateWashingMachines < ActiveRecord::Migration
  def self.up
    create_table :washing_machines do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.integer :rpm
      t.integer :efficiency
      t.integer :consume
      t.integer :washing_efficiency
      t.integer :spin_efficiency
      t.integer :capacity
      t.integer :consume_kg
      t.integer :consume_water
      t.integer :height
      t.integer :width
      t.integer :deep
      t.string :termoefficiency

      t.timestamps
    end
  end

  def self.down
    drop_table :washing_machines
  end
end
