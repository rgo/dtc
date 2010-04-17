require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: cars
#
#  id          :integer(4)      not null, primary key
#  brand       :string(255)
#  model       :string(255)
#  diesel      :boolean(1)      default(FALSE)
#  consumption :decimal(10, 2)
#  emission    :integer(4)      default(0)
#  rating      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

