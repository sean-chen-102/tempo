class AddLikeCountToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :like_count, :integer, default: 0
  end
end
