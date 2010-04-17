class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string  :brand
      t.string  :model
      t.boolean :diesel, :default => false
      t.decimal :consumption, :precision => 10, :scale => 2 
      t.integer :emission, :default => 0
      t.string  :rating
      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
