class CreateLocationLessonUsers < ActiveRecord::Migration
  def change
    create_table :location_lesson_users do |t|
      t.integer :location_lesson_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
