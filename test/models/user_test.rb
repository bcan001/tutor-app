require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  test "user attributes must not be empty" do
  	user = User.new
  	assert user.invalid?
  	assert user.errors[:first_name].any?
  	assert user.errors[:last_name].any?
  	assert user.errors[:email].any?
  	assert user.errors[:phone].any?
  	assert user.errors[:username].any?
  	assert user.errors[:password].any?
  	assert user.errors[:tutor].any?
  end

  test "user tutor attribute should default to false" do
  	user = User.new(id: 1, first_name: "Benjamin", last_name: "Caneba", email: "bcaneba@gmail.com", phone: "9062314010", username: "bcaneba", password: "theanswer")
  	assert user.tutor == false
  end

  test "user is not valid without a unique username" do
    # user fixtures
    user = User.new(username: users(:three).username, first_name: "Benjamin")
    assert user.invalid?
    assert_equal ["username has already been taken"], user.errors[:username]
  end


end
