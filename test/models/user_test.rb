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

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", username: "example_user",
                     email: "user@example.com", password: "password")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user name should be present" do
  	@user.name = ""
    assert @user.invalid?
  end

  test "user username should be present" do
    @user.username = ""
    assert @user.invalid?
  end

  test "user email should be present" do
    @user.email = ""
    assert @user.invalid?
  end

  test "user encrypted_password should be present" do
    @user.encrypted_password = ""
    assert @user.invalid?
  end

  test "user name can't be too long" do
    @user.name = "a"*21
    assert @user.invalid?
  end

  test "user username can't be too long" do
    @user.username = "a"*21
    assert @user.invalid?
  end

  test "user username must be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = "user1@example.com"
    @user.save!
    assert_not duplicate_user.valid?
  end

  test "user email must be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = "example_user1"
    @user.save!
    assert_not duplicate_user.valid?
  end

  test "user email must follow correct format" do
    @user.email = "dajsfkla;jkf;asdf"
    assert @user.invalid?
  end

end  
