class CreateTableStudentsMeetings < ActiveRecord::Migration
  def change
    create_table :meetings_students do |t|
      t.integer :student_id
      t.integer :meeting_id
    end
  end
end
