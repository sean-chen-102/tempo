class AddActivityRefToInterests < ActiveRecord::Migration
  def change
    add_reference :interests, :activity, index: true, foreign_key: true
  end
end
