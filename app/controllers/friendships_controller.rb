class FriendshipsController < ApplicationController
	def create
		@user = User.find(session[:user_id]) if session[:user_id]
		@friendship = User.find(session[:user_id]).friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Friend Request Sent"
			redirect_to my_schools_path(@user)
		else
			flash[:notice] = "Unable to add friend"
			render 'new'
		end
	end

	def destroy
		@user = User.find(session[:user_id]) if session[:user_id]
		@friendship = User.find(session[:user_id]).friendships.find(params[:friend_id])
		@friendship.destroy
		flash[:notice] = "Successfully destroyed friendship"
		redirect_to my_schools_path(@user)
	end
end