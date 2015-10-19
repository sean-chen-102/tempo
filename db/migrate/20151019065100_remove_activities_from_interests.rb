class RemoveActivitiesFromInterests < ActiveRecord::Migration
  def change
    remove_reference :interests, :activity, index: true, foreign_key: true
  end
end
