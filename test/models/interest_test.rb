# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class InterestTest < ActiveSupport::TestCase

  def setup
    @interest = Interest.new(name: "Example Interest")
  end

  test "interest should be valid" do
    assert @interest.valid?
  end

  test "interest name should be non-empty" do
  	@interest.name = ""
  	assert @interest.invalid?
  end

  test "interest name can't be too long" do
  	@interest.name = "a"*31
  	assert @interest.invalid?
  end

end
