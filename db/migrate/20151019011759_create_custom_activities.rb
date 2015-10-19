class CreateCustomActivities < ActiveRecord::Migration
  def change
    create_table :custom_activities do |t|
      t.string :title
      t.string :content
      t.integer :completion_time

      t.timestamps null: false
    end
  end
end
