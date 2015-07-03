class PostsController < ApplicationController
	def new
		@post = Post.new
		@course = Course.find(params[:course_id])
		@school = School.find(params[:school_id])
		# binding.pry
	end
	def create
		# @course = Course.find(params[:course_id])
		# @school = School.find(params[:school_id])
		# # @user = User.find(session[:user_id]) if session[:user_id]
		# @post = Post.new(post_params)
		# @post.save
		# redirect_to school_course_path(@school,@course,@post,@user)
		
	end

	private
	def post_params
		params.require(:post).permit!
	end
end