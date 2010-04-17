require 'test_helper'

class AirConditioningTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: air_conditionings
#
#  id                      :integer(4)      not null, primary key
#  brand                   :string(255)
#  indoor_units            :integer(4)
#  indoor_unit1            :string(255)
#  indoor_unit2            :string(255)
#  outdoor_unit            :string(255)
#  description             :string(255)
#  air_condensation_type   :string(255)
#  water_condensation_type :string(255)
#  cooling_capacity        :decimal(10, 3)
#  power_cooling           :decimal(10, 3)
#  efficiency_cooling      :decimal(10, 3)
#  rating_cooling          :integer(4)
#  heating_capacity        :decimal(10, 3)
#  power_heating           :decimal(10, 3)
#  efficiency_heating      :decimal(10, 3)
#  rating_heating          :integer(4)
#  eurovent                :boolean(1)
#  created_at              :datetime
#  updated_at              :datetime
#

