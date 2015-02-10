class CreateLocationLessons < ActiveRecord::Migration
  def change
    create_table :location_lessons do |t|
      t.integer :location_id
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
