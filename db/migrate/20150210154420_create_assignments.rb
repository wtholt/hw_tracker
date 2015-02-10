class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_date
      t.text :description

      t.timestamps null: false
    end
  end
end
