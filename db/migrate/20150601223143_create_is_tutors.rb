class CreateIsTutors < ActiveRecord::Migration
  def change
    create_table :is_tutors do |t|
      t.integer :rate
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
