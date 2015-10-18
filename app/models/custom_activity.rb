# == Schema Information
#
# Table name: custom_activities
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

class CustomActivity < ActiveRecord::Base
end
