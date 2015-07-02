class School < ActiveRecord::Base
	# has many Users through user_school
	has_many :user_school
	has_many :users, :through => :user_school

	# has many Courses
	has_many :courses

	has_many :postss
	
end
