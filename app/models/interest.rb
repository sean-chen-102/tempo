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

  # Returns a JSON list of all Interests in the database.
  def self.get_interests
    interests = Interest.all

    interests.each do |interest|
      interest = interest.to_json
    end
    
    return interests
  end

end
