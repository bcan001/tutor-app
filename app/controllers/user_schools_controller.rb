class UserSchoolsController < ApplicationController

	def new
		@user = User.find(session[:user_id]) if session[:user_id]
		@schools = School.all.order("name")
		@user_school = UserSchool.new
	end
	
	def create
		@user = User.find(session[:user_id]) if session[:user_id]
		@user_school = User.find(session[:user_id]).user_school.build(:school_id => params[:user_school][:school_id])
		if @user_school.save
			flash[:notice] = "School added to your list"
			redirect_to user_path(@user)
		else
			flash[:notice] = "Unable to add school to your list"
			redirect_to user_path(@user)
			
		end
	end

	def destroy
		@user = User.find(session[:user_id]) if session[:user_id]

		# binding.pry
		@user_school = User.find(session[:user_id]).user_school.find(params[:id])

		# @friendship = User.find(session[:user_id]).friendships.find(params[:friend_id])

		@user_school.destroy

		# @favorites = Favorite.where({user_id: @user.id, course_id: }).delete_all



		flash[:notice] = "School removed from list"
		redirect_to user_path(@user)
	end

end