class AddCompletedActivitiesToUser < ActiveRecord::Migration
  def change
    add_column :users, :completed_activities, :int, array:true, default: [] 
  end
end
