class CreateWorktopInductions < ActiveRecord::Migration
  def self.up
    create_table :worktop_inductions do |t|
      t.string :producer
      t.string :product
      t.string :brand
      t.string :model
      t.string :type
      t.integer :total_torchs
      t.integer :inductio_torchs
      t.integer :width_ext
      t.integer :deep_ext
      t.integer :width_ins
      t.integer :deep_ins
      t.integer :power_torchs
      t.integer :power_induction_torchs

      t.timestamps
    end
  end

  def self.down
    drop_table :worktop_inductions
  end
end
