class CreateOvens < ActiveRecord::Migration
  def self.up
    create_table :ovens do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.string :type
      t.string :efficiency
      t.decimal :consume, :precision => 10, :scale => 3
      t.integer :volume
      t.string :warming
      t.integer :height
      t.integer :width
      t.integer :deep

      t.timestamps
    end
  end

  def self.down
    drop_table :ovens
  end
end
