class AddDislikesColumnToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :dislike_count, :integer, default: 0
  end
end
