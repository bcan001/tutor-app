class UserSchoolsController < ApplicationController

	def new
		@user = User.find(session[:user_id]) if session[:user_id]
		@schools = School.all
		@user_school = UserSchool.new
	end
	
	def create
		@user = User.find(session[:user_id]) if session[:user_id]
		@user_school = User.find(session[:user_id]).user_school.build(:school_id => params[:user_school][:school_id])
		if @user_school.save
			flash[:notice] = "school added to your list"
			redirect_to user_path(@user)
		else
			flash[:notice] = "Unable to add school to your list"
			render 'new'
		end
	end

	def destroy
		@user_school = User.find(session[:user_id]).schools.build(:school_id => params[:school_id])
		@user_school.destroy
		flash[:notice] = "school removed from user id"
		redirect_to root_path
	end

end