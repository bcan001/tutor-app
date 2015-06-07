class AddTutorColumn < ActiveRecord::Migration
  def change
  	add_column :is_tutors, :course_id, :integer
  end
end
