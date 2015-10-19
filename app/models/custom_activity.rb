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
#

class CustomActivity < ActiveRecord::Base
	# Associations
	belongs_to :user

	# Validations
	validates :title, presence: true
	validates :title, length: { maximum: 128 }

	validates :completion_time, numericality: { greater_than: 0,
											    less_than_or_equal_to: 60 }
end
