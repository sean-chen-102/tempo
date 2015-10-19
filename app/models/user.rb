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
  #validates :name, :username, length: { maximum: 20 }
  #validates :username, :email, uniqueness: true
  #validates :password, length: { minimum: 8 }, unless: "password.nil?"
  
  # validates :email, format: { with: ^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$, message: "only allows letters" }

end
