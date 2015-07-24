class UserSchool < ActiveRecord::Base
	belongs_to :user
	belongs_to :school

	validates_uniqueness_of :user_id, :scope => :school_id
end


