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

class Activity < ActiveRecord::Base
	# Associations
	has_and_belongs_to_many :interests

	# Validations
	validates :title, presence: true
	validates :title, length: { maximum: 128 }
  validates :like_count, presence: true

	validates :completion_time, numericality: { greater_than: 0,
											    less_than_or_equal_to: 60 }

  # Returns a JSON list of all activities that match the Interests provided in interests_list, with
  # completion_time less than or equal to time.
  # If interests_list is nil, it returns a JSON list of all Activities in the database.
  def self.get_activities(interests_list, time)
    activities_list = []

    if interests_list.nil?
      activities = Activity.all
    else
      activities = Activity.joins(:interests).distinct.where(interests: {name: interests_list})
    end

    if not time.nil?
      activities = activities.where("completion_time <= ?", time)
    end

    activities = activities.as_json
    return activities
  end

  # Returns a list of all interests that the specified activity belongs to
  def self.get_interests(activity_id)
    return interests = Interest.joins(:activities).where(activities: {id: activity_id})\
  end

end
