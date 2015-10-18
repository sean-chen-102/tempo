# == Schema Information
#
# Table name: activities
#
#  id              :integer          not null, primary key
#  name            :string
#  completion_time :integer
#  link            :string
#  snippet         :string
#  content         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
