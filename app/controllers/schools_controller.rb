class SchoolsController < ApplicationController
	def index
		@schools = School.all.order("name")
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
			UserSchool.create(user_id: @user.id, school_id: @school.id)
			redirect_to user_path(@user)
		else
			flash[:notice] = "Please fill in the proper fields"
			
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
		@schools = School.order("name").paginate(:page => params[:page], :per_page => 500)
	end

	private
	def school_params
		params.require(:school).permit(:name, :location, :state)
	end

end
