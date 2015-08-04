class School < ActiveRecord::Base
	# has many Users through user_school
	has_many :user_school
	has_many :users, :through => :user_school

	# has many Courses
	has_many :courses, dependent: :destroy

	has_many :posts, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates :location, presence: true
	validates :state, presence: true


	
end
