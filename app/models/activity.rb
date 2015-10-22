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
#

class Activity < ActiveRecord::Base
	# Associations
	has_and_belongs_to_many :interests

	# Validations
	validates :title, presence: true
	validates :title, length: { maximum: 128 }

	validates :completion_time, numericality: { greater_than: 0,
											    less_than_or_equal_to: 60 }

  # Returns a JSON list of all activities that have interest_name as their Interest.name.
  # If interest_name is nil, it returns a JSON list of all Activities in the database.
  def self.get_activities(interest_name)
    if interest_name.nil?
      activities = Activity.all
    else
      activities = Activity.joins(:interests).where(interests: {name: interest_name})
    end

    activities = activities.to_json
    return activities
  end

end
