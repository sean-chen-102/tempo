class CreateJoinTableActivityInterest < ActiveRecord::Migration
  def change
    create_join_table :activities, :interests do |t|
       t.index [:activity_id, :interest_id]
       t.index [:interest_id, :activity_id]
    end
  end
end
