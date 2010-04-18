class ModifyConsume < ActiveRecord::Migration
  def self.up
    change_column :washing_machines, :consume, :decimal, :precision => 10, :scale => 3
    change_column :washing_machines, :consume_kg, :decimal, :precision => 10, :scale => 3
  end

  def self.down
    change_column :washing_machines, :consume, :integer
    change_column :washing_machines, :consume_kg, :integer
  end
end
