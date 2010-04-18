class CreateDishwashers < ActiveRecord::Migration
  def self.up
    create_table :dishwashers do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.integer :efficiency
      t.decimal :consume, :precision => 10, :scale => 3
      t.integer :washing_efficiency
      t.integer :drying_efficiency
      t.integer :cutlery
      t.integer :water_consume
      t.integer :height
      t.integer :width
      t.integer :deep
      t.string :termoefficiency

      t.timestamps
    end
  end

  def self.down
    drop_table :dishwashers
  end
end
