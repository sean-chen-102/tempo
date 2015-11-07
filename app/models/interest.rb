# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interest < ActiveRecord::Base
	# Associations
	has_and_belongs_to_many :activities
  has_and_belongs_to_many :users

	# Validations
	validates :name, presence: true, uniqueness: true
	validates :name, length: { maximum: 30 }

  # Returns a JSON list of all Interests in the database.
  def self.get_interests
    interests = Interest.all

    interests.each do |interest|
      interest = interest.to_json
    end
    
    return interests
  end

  # Returns a list of all Users who have the specified interest
  def self.get_users(interest_id)
    return User.joins(:interests).where(interests: {id: interest_id})
  end

end
