class AddLikeCountToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :like_count, :integer
  end
end
