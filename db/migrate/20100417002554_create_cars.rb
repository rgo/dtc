class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string  :brand
      t.string  :model
      t.string  :finish
      t.string  :fuel
      t.decimal :consume, :precision => 10, :scale => 2 
      t.integer :consume_range
      t.integer :emissions, :default => 0
      t.string  :rating
      t.string  :market_segment
      t.integer :engine
      t.integer :cylinders
      t.string  :wheel_drive
      t.string  :gear
      t.string  :minimal_tare
      t.decimal :power, :precision => 10, :scale => 2
      t.integer :torque
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :seats

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
