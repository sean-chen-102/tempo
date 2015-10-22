# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Interest < ActiveRecord::Base
	# Associations
	has_and_belongs_to_many :activities
  belongs_to :users

	# Validations
	validates :name, presence: true
	validates :name, length: { maximum: 30 }

  # Returns a JSON list of all interests that have user_id as their User.id.
  # If user_id is nil, it returns a JSON list of all Interests in the database.
  def self.get_interests(user_id)
    if user_id.nil?
      interests = Interest.all
    else
      interests = Interest.joins(:users).where(users: {id: user_id})
    end
    
    interests = interests.to_json
    return interests
  end

end
