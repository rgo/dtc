# == Schema Information
#
# Table name: freezers
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brnand     :string(255)
#  model      :string(255)
#  consume    :decimal(10, 3)
#  height     :integer(4)
#  width      :integer(4)
#  froost     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#
class Freezer < ActiveRecord::Base

  define_indexes do
    indexes producer
    indexes product
    indexes brand
    indexes model
  end
end

