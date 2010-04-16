class CreateWashingMachines < ActiveRecord::Migration
  def self.up
    create_table :washing_machines do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.integer :rpm
      t.string :efficiency
      t.integer :consume
      t.string :washing_efficiency
      t.string :spin_efficiency
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
