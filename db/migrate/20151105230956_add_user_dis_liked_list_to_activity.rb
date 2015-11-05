class AddUserDisLikedListToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :user_disliked_list, :int, array: true, default: []
  end
end
