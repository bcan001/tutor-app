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
		@course = Course.new
		# @school = @course.school

	end
	def create
		@course = Course.new(course_params)
		@school = @course.school
		# binding.pry
		if @course.save
			redirect_to school_path(params[:school_id])
		else
			render 'new'
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end

	private
	def course_params
		params.require(:course).permit!
	end
end
