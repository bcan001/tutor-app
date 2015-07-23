class SchoolsController < ApplicationController
	def index
		@schools = School.all
	end
	def show
		@school = School.find(params[:id])
		@courses = @school.courses.all

		@users = @school.users
	end
	def new
		@school = School.new
	end
	def create
		@user = User.find(session[:user_id]) if session[:user_id]
		@school = School.new(school_params)
		if @school.save
			flash[:notice] = "School Successfully created"
			redirect_to user_path(@user)
		else
			@error = "Please fill in the fields correctly to create a new school"
			render 'new'
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def all_schools
		@schools = School.all
	end

	private
	def school_params
		params.require(:school).permit!
	end

end
