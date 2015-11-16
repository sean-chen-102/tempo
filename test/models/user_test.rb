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

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", username: "example_user",
                     email: "user@example.com", password: "password", password_confirmation: "password")
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
    @user.password_digest = ""
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
    @user.password = "password"
    @user.password_confirmation = "password"
    @user.save!
    assert_not duplicate_user.valid?
  end

  test "user email must be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = "example_user1"
    @user.password = "password"
    @user.password_confirmation = "password"
    @user.save!
    assert_not duplicate_user.valid?
  end

  test "user email must follow correct format" do
    @user.email = "dajsfkla;jkf;asdf"
    assert @user.invalid?
  end

end  
