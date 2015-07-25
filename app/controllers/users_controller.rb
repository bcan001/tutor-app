class UsersController < ApplicationController
	def index
		@users = User.order("username").paginate(:page => params[:page], :per_page => 100)
	end
	def show
		@user = User.find(session[:user_id]) if session[:user_id]
		@schools = @user.schools
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
			redirect_to root_path
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
		@courses = Course.all
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :phone)
	end
end
