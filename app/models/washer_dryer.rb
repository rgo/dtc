# == Schema Information
#
# Table name: washer_dryers
#
#  id                 :integer(4)      not null, primary key
#  producer           :string(255)
#  product            :string(255)
#  brand              :string(255)
#  model              :string(255)
#  rpm                :integer(4)
#  efficiency         :string(255)
#  consume            :decimal(10, 3)
#  washing_consume    :decimal(10, 3)
#  washing_efficiency :string(255)
#  washing_capacity   :integer(4)
#  drying_capacity    :integer(4)
#  consume_kg         :decimal(10, 3)
#  water_consume      :integer(4)
#  height             :integer(4)
#  width              :integer(4)
#  deep               :integer(4)
#  termoefficiency    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
class WasherDryer < ActiveRecord::Base
end

