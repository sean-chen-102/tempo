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

  # Returns a list of CustomActivities belonging to the specified User, 
  # filtered by CustomActivities that take less than or equal to the 
  # specified time to complete. Returns all CustomActivities belonging to
  # the User if time is nil.
  def self.get_filtered_custom_activities(user, time)
    filtered_custom_activities = []

    if not user.nil?
      custom_activities = user.custom_activities

      if not time.nil?
        filtered_custom_activities = custom_activities.where("completion_time <= ?", time)
      else
        filtered_custom_activities = custom_activities
      end
    end

    return filtered_custom_activities.as_json
  end

end
