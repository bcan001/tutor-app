class PostsId < ActiveRecord::Migration
  def change
  	add_column :posts, :user_id, :string
  	add_column :posts, :school_id, :string
  	add_column :posts, :course_id, :string
  end
end
