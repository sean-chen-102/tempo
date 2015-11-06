class AddUserLikedListToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :user_liked_list, :int, array:true, default: []
  end
end
