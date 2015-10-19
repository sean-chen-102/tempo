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
	has_many :activities

	# Validations
	validates :name, presence: true
	validates :name, length: { maximum: 30 }
end
