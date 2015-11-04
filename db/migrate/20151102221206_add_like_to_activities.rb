class AddLikeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :like_meter, :integer
  end
end
