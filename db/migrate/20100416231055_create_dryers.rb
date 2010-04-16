class CreateDryers < ActiveRecord::Migration
  def self.up
    create_table :dryers do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.string :efficiency
      t.decimal :consume, :precision => 10, :scale => 3
      t.integer :capacity
      t.decimal :consume_kg, :precision => 10, :scale => 3
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
