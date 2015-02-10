class AddIdsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :assignment_id, :integer
    add_column :submissions, :user_id, :integer
  end
end
