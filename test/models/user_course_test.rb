require 'test_helper'

class UserCourseTest < ActiveSupport::TestCase
  test "users cant add the same course to their course list" do
    @user_course = UserCourse.new(course_id: 1, user_id: 1)
    assert @user_course.invalid?
  end
end



