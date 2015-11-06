class AddDisLikedListToUser < ActiveRecord::Migration
  def change
    add_column :users, :disliked_list, :int, array: true, default: []
  end
end
