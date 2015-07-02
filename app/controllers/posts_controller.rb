class PostsController < ApplicationController
	def new
		# @post = Post.new(course_id: @course.id)
		# binding.pry
		@post = Post.new
		# binding.pry
		@course = Course.find(params[:course_id])
		@school = School.find(params[:school_id])
	end

end