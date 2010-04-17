require 'test_helper'

class WorktopGaTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: worktop_gas
#
#  id                   :integer(4)      not null, primary key
#  producer             :string(255)
#  product              :string(255)
#  brand                :string(255)
#  model                :string(255)
#  type                 :string(255)
#  total_torchs         :integer(4)
#  width_ext            :integer(4)
#  deep_ext             :integer(4)
#  width_ins            :integer(4)
#  deep_ins             :integer(4)
#  power_radiant_torchs :integer(4)
#  created_at           :datetime
#  updated_at           :datetime
#

