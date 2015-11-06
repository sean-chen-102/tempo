class AddLikedListToUser < ActiveRecord::Migration
  def change
    add_column :users, :liked_list, :int, array:true, default: []
  end
end
