class UsersController < ApplicationController
	def index
	end
	def show
		@user = User.find(session[:user_id]) if session[:user_id]
		# binding.pry
		@schools = @user.schools
		# binding.pry
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.save
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "User Successfully created"
			# redirect_to select_school_path(session[:user_id])
			redirect_to user_path(@user)
		else
			@error = "Please fill in the fields correctly to create a user"
			render 'new'
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def profile_schools
		@user = User.find(session[:user_id]) if session[:user_id]
		@schools = @user.schools
	end

	def profile_courses
	end


	private
	def user_params
		params.require(:user).permit(:username, :password, :first_name, :last_name, :email)
	end
end
