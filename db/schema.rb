# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100416234717) do

  create_table "dishwashers", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.string   "efficiency"
    t.decimal  "consume",            :precision => 10, :scale => 3
    t.string   "washing_efficiency"
    t.string   "drying_efficiency"
    t.integer  "cutlery"
    t.integer  "water_consume"
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.string   "termoefficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dryers", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.string   "efficiency"
    t.decimal  "consume",    :precision => 10, :scale => 3
    t.integer  "capacity"
    t.decimal  "consume_kg", :precision => 10, :scale => 3
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "freezers", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brnand"
    t.string   "model"
    t.decimal  "consume",    :precision => 10, :scale => 3
    t.integer  "height"
    t.integer  "width"
    t.boolean  "froost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fridge_freezers", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.string   "efficiency"
    t.decimal  "consume",    :precision => 10, :scale => 3
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.boolean  "froost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fridges", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.string   "efficiency"
    t.decimal  "consume",    :precision => 10, :scale => 3
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.boolean  "froost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ovens", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.string   "type"
    t.string   "efficiency"
    t.decimal  "consume",    :precision => 10, :scale => 3
    t.integer  "volume"
    t.string   "warming"
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "washer_dryers", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.integer  "rpm"
    t.string   "efficiency"
    t.decimal  "consume",            :precision => 10, :scale => 3
    t.decimal  "washing_consume",    :precision => 10, :scale => 3
    t.string   "washing_efficiency"
    t.integer  "washing_capacity"
    t.integer  "drying_capacity"
    t.decimal  "consume_kg",         :precision => 10, :scale => 3
    t.integer  "water_consume"
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.string   "termoefficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "washing_machines", :force => true do |t|
    t.string   "producer"
    t.string   "product"
    t.string   "brand"
    t.string   "model"
    t.integer  "rpm"
    t.string   "efficiency"
    t.integer  "consume"
    t.string   "washing_efficiency"
    t.string   "spin_efficiency"
    t.integer  "capacity"
    t.integer  "consume_kg"
    t.integer  "consume_water"
    t.integer  "height"
    t.integer  "width"
    t.integer  "deep"
    t.string   "termoefficiency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
