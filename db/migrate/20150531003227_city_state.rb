class CityState < ActiveRecord::Migration
  def change
  	# change_column :schools, :location, :city
  	add_column :schools, :state, :string

  end
end
