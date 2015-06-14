require 'test_helper'

class UserSchoolTest < ActiveSupport::TestCase
  test "users can't add the same school twice to their school list" do
  	user_school = UserSchool.new(user_id: 1, school_id: 1)
    assert user_school.invalid?
  end
end


