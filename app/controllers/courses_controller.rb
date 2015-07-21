class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end
	def show
		@course = Course.find(params[:id])
		# @school = School.where(id: @course.school_id)
		@school = @course.school
	end
	def new
		# binding.pry
		# @course = Course.new
		# @school = @course.school

	end
	def create

	end
	def edit
	end
	def update
	end
	def destroy
	end
end
