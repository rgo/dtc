# == Schema Information
#
# Table name: washing_machines
#
#  id                 :integer(4)      not null, primary key
#  producer           :string(255)
#  product            :string(255)
#  brand              :string(255)
#  model              :string(255)
#  rpm                :integer(4)
#  efficiency         :string(255)
#  consume            :integer(4)
#  washing_efficiency :string(255)
#  spin_efficiency    :string(255)
#  capacity           :integer(4)
#  consume_kg         :integer(4)
#  consume_water      :integer(4)
#  height             :integer(4)
#  width              :integer(4)
#  deep               :integer(4)
#  termoefficiency    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
class WashingMachine < ActiveRecord::Base
end
