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

	# Validations
	validates :name, presence: true
	validates :name, length: { maximum: 30 }
end
