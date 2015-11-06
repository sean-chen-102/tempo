# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  name                        :string
#  username                    :string
#  email                       :string
#  password_digest             :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  role                        :integer          default(0)
#  activation_digest           :string
#  activated                   :boolean          default(FALSE)
#  activated_at                :datetime
#  liked_list                  :integer          default([]), is an Array
#  disliked_list               :integer          default([]), is an Array
#  completed_activities        :integer          default([]), is an Array
#  completed_custom_activities :integer          default([]), is an Array
#

class User < ActiveRecord::Base
  # Before actions
  before_create :create_activation_digest
  before_save   :downcase_email
  attr_accessor :activation_token, :reset_token

  # Associations
  has_and_belongs_to_many :interests
  has_many :custom_activities, :dependent => :delete_all

  # Validations
  validates :name, :username, :email, presence: true
  validates :name, :username, length: { maximum: 20 }
  validates :username, :email, uniqueness: true
  # TODO: Need to check this validation
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_nil: true }
  validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\z/
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # Authentication
  has_secure_password

  # Define User Roles
  enum role: { user: 0, admin: 1 }

  # Returns a JSON list of all custom_activities of the User with id = user_id
  def self.get_custom_activities(user_id)
    custom_activities = User.find_by(id: user_id).custom_activities

    custom_activities.each do |custom_activity|
      custom_activity = custom_activity.to_json
    end

    return custom_activities
  end

  # Returns a JSON list of all interests that have user_id as their User.id.
  def self.get_interests(user_id)
    interests = User.find_by(id: user_id).interests

    interests.each do |interest|
      interest = interest.to_json
    end

    return interests
  end

  # Adds the custom_activity to the User's list of CustomActivities.
  def add_custom_activity(custom_activity)
    user = self
    user.custom_activities << custom_activity
    user.save
  end

  # Update the User's password to new_password
  def change_password(new_password)
    if not new_password.blank? and new_password.length >= 8
      self.password = new_password
      return self.save
    else
      return false
    end
  end

  # Returns a hash of basic user info.
  # NOTE: This info is not secure - it is visible by everyone.
  def get_basic_info
    user_data = { "id": self.id, "name": self.name, "username": self.username, "email": self.email, "created_at": self.created_at, "updated_at": self.updated_at }
    return user_data
  end

  # Returns a hash of advanced user info.
  # NOTE: This info should only be viewed by an authorized and authenticated user.
  def get_advanced_info
    user_data = self.get_basic_info()
    user_data["interests"] = self.interests
    user_data["custom_activities"] = self.custom_activities
    return user_data
  end

  # Generates and returns a signed hash token based on the user_id and a 
  # randomly generated string.
  def get_signed_token
    random_string = SecureRandom.hex
    payload = { user_id: self.id, random_string: random_string }

    # generate the signed token
    token = AuthToken.encode(payload)

    return token
  end

  # Returns an authenticated User if the passed in hash token contains a valid user session,
  # and nil otherwise. The token is not valid if it was tampered with.
  def self.authenticate_token(token)
    # Set password to nil and validation to false otherwise this won't work
    decoded_token =  AuthToken.decode(token)

    if decoded_token.nil? # the token was not valid
      return nil
    end

    user_id = decoded_token[0]["user_id"]
    user = User.find_by(id: user_id)

    if not user.nil?
      return user
    else
      return nil
    end
  end

  # An AuthToken class for encoding and decoding JWT authorization tokens.
  class AuthToken
    # grab our application's secret code
    @hmac_secret = Rails.application.secrets.secret_key_base
    @algorithm = 'HS256'

    # Returns an encoded JWT token.
    def self.encode(payload, exp=7.days.from_now)
      # set our expiration time
      exp = exp.to_i
      payload[:exp] = exp

      # encode and return our token
      return JWT.encode(payload, @hmac_secret, @algorithm)
    end

    # Returns the payload of the given JWT token. If the token can't be validated, 
    # it returns nil.
    def self.decode(token)
      begin
        # try to decode the token
        decoded_token = JWT.decode(token, @hmac_secret, true, { algorithm: @algorithm })
      rescue JWT::ExpiredSignature
        # the token has expired, they should be logged out and asked to log back in
        decoded_token = nil
      rescue JWT::VerificationError
        # the token was not valid
        decoded_token = nil
      rescue JWT::DecodeError
        # the token was formatted incorrectly
        decoded_token = nil
      end

      return decoded_token
    end
  end

  # Returns the hash digest of the given string. Uses a minimal cost for computing 
  # the hash while in testing mode, and a high-security hash while in production
  # mode.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    hash = BCrypt::Password.create(string, cost: cost)
    return hash
  end

  # Returns a random token for use with digests and hashes.
  def self.new_token
    return SecureRandom.urlsafe_base64
  end

  private

    # Create an activation token and digest for this User.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    # Convert the User's email address to all lowercase.
    def downcase_email
      self.email = email.downcase
    end

end
