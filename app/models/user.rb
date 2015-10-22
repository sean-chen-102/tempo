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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :interests
  has_many :custom_activities

  # Validations
  validates :name, :username, :email, :encrypted_password, presence: true
  validates :name, :username, length: { maximum: 20 }
  validates :username, :email, uniqueness: true
  # TODO: Need to check this validation
  validates :password, length: { minimum: 8 }, unless: "password.nil?"
  
  validates_format_of :email,:with => Devise::email_regexp

  # Returns a JSON list of all custom_activities of the User with id = user_id
  def self.get_custom_activities(user_id)
    custom_activities = User.find(user_id).custom_activities
    custom_activities = custom_activities.to_json
    return custom_activities
  end

end
