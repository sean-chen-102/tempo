class AddUsersToCustomActivities < ActiveRecord::Migration
  def change
    add_reference :custom_activities, :user, index: true, foreign_key: true
  end
end
