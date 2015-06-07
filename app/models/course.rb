class Course < ActiveRecord::Base
	# belongs to a school
	belongs_to :school

	# has many users through user_course
	has_many :user_course
	has_many :users, :through => :user_course


	has_many :posts
	has_many :is_tutors
end
