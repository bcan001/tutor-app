class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end
	def show
		@course = Course.find(params[:id])
		@school = @course.school
	end
	def new
		@course = Course.new
	end
	def create
		@course = Course.new(course_params)
		@school = @course.school
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
