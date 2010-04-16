class CreateFreezers < ActiveRecord::Migration
  def self.up
    create_table :freezers do |t|
      t.string :producer
      t.string :product
      t.string :brnand
      t.string :model
      t.decimal :consume
      t.integer :height
      t.integer :width
      t.boolean :froost

      t.timestamps
    end
  end

  def self.down
    drop_table :freezers
  end
end
