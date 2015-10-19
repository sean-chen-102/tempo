# == Schema Information
#
# Table name: custom_activities
#
#  id              :integer          not null, primary key
#  title           :string
#  content         :string
#  completion_time :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'test_helper'

class CustomActivityTest < ActiveSupport::TestCase

  def setup
    @activity = CustomActivity.new(title: "Example Activity", content: "dummy content",
    								completion_time: 15, user_id: 1)
  end

  test "custom_activity should be valid" do
  	assert @activity.valid?
  end

  test "custom_activity title should be present" do
  	@activity.title = ""
  	assert @activity.invalid?
  end

  test "custom_activity can't be too long" do
  	@activity.title = "a"*129
  	assert @activity.invalid?
  end

  test "custom_activity completion_time must be within range" do
  	assert @activity.valid?
  	@activity.completion_time = -1
  	assert @activity.invalid?, "negative completion_time test failed"
  	@activity.completion_time = 61
  	assert @activity.invalid?, "completion_time > 60 test failed"
  end

end
