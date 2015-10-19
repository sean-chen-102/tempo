class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :content
      t.integer :completion_time
      t.string :content_type
      t.string :link

      t.timestamps null: false
    end
  end
end
