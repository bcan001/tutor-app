class Post < ActiveRecord::Base
	belongs_to :school
	belongs_to :course
	belongs_to :user
end
