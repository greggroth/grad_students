class CreateMeetingAttendances < ActiveRecord::Migration
  def change
    create_table :meeting_attendances do |t|
      t.integer :student_id
      t.integer :meeting_id

      t.timestamps
    end
  end
end
