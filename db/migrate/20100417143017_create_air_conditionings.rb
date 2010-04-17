class CreateAirConditionings < ActiveRecord::Migration
  def self.up
    create_table :air_conditionings do |t|
      t.string :brand
      t.integer :indoor_units
      t.string :indoor_unit1
      t.string :indoor_unit2
      t.string :outdoor_unit
      t.string :description
      t.string :air_condensation_type
      t.string :water_condensation_type
      t.decimal :cooling_capacity, :precision => 10, :scale => 3
      t.decimal :power_cooling, :precision => 10, :scale => 3
      t.decimal :efficiency_cooling, :precision => 10, :scale => 3
      t.integer :rating_cooling
      t.decimal :heating_capacity, :precision => 10, :scale => 3
      t.decimal :power_heating, :precision => 10, :scale => 3
      t.decimal :efficiency_heating, :precision => 10, :scale => 3
      t.integer :rating_heating
      t.boolean :eurovent

      t.timestamps
    end
  end

  def self.down
    drop_table :air_conditionings
  end
end
