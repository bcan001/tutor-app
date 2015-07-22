class Changefavoritename < ActiveRecord::Migration
  def change
  	rename_table :favorites, :user_favorites
  end
end
