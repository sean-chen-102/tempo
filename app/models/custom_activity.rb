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

class CustomActivity < ActiveRecord::Base
	# Associations
	belongs_to :user

	# Validations
	validates :title, presence: true
	validates :title, length: { maximum: 128 }

	validates :completion_time, numericality: { greater_than: 0,
											    less_than_or_equal_to: 60 }

  # Returns true if this CustomActivity belongs to the specified User
  def belongs_to_user(user)
    custom_activity = self
    return user.custom_activities.include? custom_activity
  end
end
