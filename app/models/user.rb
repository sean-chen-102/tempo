# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  username               :string
#

class User < ActiveRecord::Base
  attr_accessor :login

  # Associations
  has_many :interests
  has_many :custom_activities

  # Validations
  validates :name, :username, :email, :password_digest, presence: true
  validates :name, :username, length: { maximum: 20 }
  validates :username, :email, uniqueness: true
  # TODO: Need to check this validation
  # validates :password, length: { minimum: 8 }, unless: "password.nil?"
  
  validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\z/
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # Returns a JSON list of all custom_activities of the User with id = user_id
  def self.get_custom_activities(user_id)
    custom_activities = User.find(user_id).custom_activities
    custom_activities = custom_activities.to_json
    return custom_activities
  end

  # Returns a JSON list of all interests that have user_id as their User.id.
  def self.get_interests(user_id)
    interests = Interest.where(user_id: user_id)

    interests = interests.to_json
    return interests
  end

end
