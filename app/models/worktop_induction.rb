# == Schema Information
#
# Table name: worktop_inductions
#
#  id                     :integer(4)      not null, primary key
#  producer               :string(255)
#  product                :string(255)
#  brand                  :string(255)
#  model                  :string(255)
#  type                   :string(255)
#  total_torchs           :integer(4)
#  inductio_torchs        :integer(4)
#  width_ext              :integer(4)
#  deep_ext               :integer(4)
#  width_ins              :integer(4)
#  deep_ins               :integer(4)
#  power_torchs           :integer(4)
#  power_induction_torchs :integer(4)
#  created_at             :datetime
#  updated_at             :datetime
#
class WorktopInduction < ActiveRecord::Base
end

