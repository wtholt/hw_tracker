class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :workflow_state
      

      t.timestamps null: false
    end
  end
end
