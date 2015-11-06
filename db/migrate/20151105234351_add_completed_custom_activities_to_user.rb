class AddCompletedCustomActivitiesToUser < ActiveRecord::Migration
  def change
    add_column :users, :completed_custom_activities, :int, array:true, default: [] 
  end
end
