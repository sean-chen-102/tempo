# == Schema Information
#
# Table name: activities
#
#  id              :integer          not null, primary key
#  title           :string
#  content         :string
#  completion_time :integer
#  content_type    :string
#  link            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  like_count      :integer          default(0)
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @activity = Activity.new(title: "Example Activity", content: "dummy content",
    						 completion_time: 15, content_type: "video",
    						 link: "www.example.com", like_count: 0)
  end

  test "activity should be valid" do
	assert @activity.valid?  	
  end

  test "activity title should be present" do
  	@activity.title = ""
  	assert @activity.invalid?
  end

  test "activity title can't be too long" do
  	@activity.title = "a"*129
  	assert @activity.invalid?
  end

  test "activity completion_time must be within range" do
  	assert @activity.valid?
  	@activity.completion_time = -1
  	assert @activity.invalid?, "negative completion_time test failed"
  	@activity.completion_time = 61
  	assert @activity.invalid?, "completion_time > 60 test failed"
  end

end
