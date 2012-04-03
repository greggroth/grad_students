class DropTableMeetingsStudents < ActiveRecord::Migration
  def up
    drop_table :meetings_students
  end

  def down
  end
end
