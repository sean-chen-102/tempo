class CreateCustomActivities < ActiveRecord::Migration
  def change
    create_table :custom_activities do |t|
      t.string :name
      t.integer :completion_time
      t.string :link
      t.string :snippet
      t.string :content

      t.timestamps null: false
    end
  end
end
