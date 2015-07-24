class Favorite < ActiveRecord::Base
	belongs_to :user

	validates_uniqueness_of :user_id, :scope => :course_id
end