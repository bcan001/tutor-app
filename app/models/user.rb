class User < ActiveRecord::Base
	has_secure_password

	# User has many Schools through user_school
	has_many :user_school
	has_many :schools, :through => :user_school

	# User has many Courses through user_course
	has_many :user_course
	has_many :courses, :through => :user_course


	has_many :posts

	has_one :is_tutor



	has_many :friendships
	has_many :friends, :through => :friendships

	# determine what other users have added a user as a friend
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user


	# validations for a user
	validates(:username, uniqueness: true)
	validates(:email, uniqueness: true)


end
