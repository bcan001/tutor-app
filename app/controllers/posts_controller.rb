class PostsController < ApplicationController
	def new
		@post = Post.new
		@course = Course.find(params[:school_id])
		@school = School.find(params[:course_id])
	end
	def create
		@user = User.find(session[:user_id]) if session[:user_id]
		@course = Course.find(params[:course_id])
		@school = School.find(params[:school_id])
		@post = Post.new(user_id: @user.id, school_id: @school.id, course_id: @course.id, title: params[:post][:title], description: params[:post][:description])
		@post.save
		redirect_to school_course_path(@school,@course,@post,@user)
	end
end