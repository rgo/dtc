# == Schema Information
#
# Table name: ovens
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  type       :string(255)
#  efficiency :string(255)
#  consume    :decimal(10, 3)
#  volume     :integer(4)
#  warming    :string(255)
#  height     :integer(4)
#  width      :integer(4)
#  deep       :integer(4)
#  created_at :datetime
#  updated_at :datetime
#
class Oven < ActiveRecord::Base

  define_indexes do
    indexes producer
    indexes product
    indexes brand
    indexes model
  end
end
