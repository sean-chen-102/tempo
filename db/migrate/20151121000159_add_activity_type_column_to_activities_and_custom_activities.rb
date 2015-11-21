class AddActivityTypeColumnToActivitiesAndCustomActivities < ActiveRecord::Migration
  def change
    add_column :activities, :activity_type, :string, default: "activity"
    add_column :custom_activities, :activity_type, :string, default: "custom_activity"
  end
end
