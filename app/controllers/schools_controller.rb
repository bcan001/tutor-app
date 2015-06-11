class SchoolsController < ApplicationController
	def index
		@schools = School.all
	end
	def show
		@school = School.find(params[:id])
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

	def select
		@user = User.find(session[:user_id]) if session[:user_id]
		@schools = School.all
	end
end
