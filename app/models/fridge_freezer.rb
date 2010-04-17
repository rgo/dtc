# == Schema Information
#
# Table name: fridge_freezers
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  efficiency :string(255)
#  consume    :decimal(10, 3)
#  height     :integer(4)
#  width      :integer(4)
#  deep       :integer(4)
#  froost     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#
class FridgeFreezer < ActiveRecord::Base
end
