require 'test_helper'

class DryerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: dryers
#
#  id         :integer(4)      not null, primary key
#  producer   :string(255)
#  product    :string(255)
#  brand      :string(255)
#  model      :string(255)
#  efficiency :string(255)
#  consume    :decimal(10, 3)
#  capacity   :integer(4)
#  consume_kg :decimal(10, 3)
#  height     :integer(4)
#  width      :integer(4)
#  deep       :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

