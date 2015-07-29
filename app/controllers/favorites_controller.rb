class FavoritesController < ApplicationController
	def new
	end
	def create
		# binding.pry
		@user = User.find(session[:user_id]) if session[:user_id]

		Favorite.create(user_id: @user.id, course_id: params[:school_id])

		flash[:notice] = "Successfully added course to favorites"

		redirect_to user_path(@user)
	end
	def destroy



	end

end