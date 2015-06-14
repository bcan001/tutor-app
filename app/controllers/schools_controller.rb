class SchoolsController < ApplicationController
	def index
		@schools = School.all
	end
	def show
		@school = School.find(params[:id])
		@courses = @school.courses.all
	end
	def new
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
