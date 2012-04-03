class MeetingAttendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :meeting
end
