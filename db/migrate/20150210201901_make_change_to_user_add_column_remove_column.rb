class MakeChangeToUserAddColumnRemoveColumn < ActiveRecord::Migration
  def change
    remove_column :users, :location_id, :integer
    add_reference :users, :location, index: true
    add_foreign_key :users, :locations
  end
end
