desc  "Import data to the database from an xml file"
namespace :import do
  
  task :all, [:directory] => [:environment] do |t, args|
    Rake::Task['import:students'].invoke("#{args[:directory]}/Students.xml")
    Rake::Task['import:professors'].invoke("#{args[:directory]}/CommitteeMembers.xml")
    Rake::Task['import:committees'].invoke("#{args[:directory]}/Committees.xml")
    Rake::Task['import:meetings'].invoke("#{args[:directory]}/Meetings.xml")
    Rake::Task['import:student_meetings'].invoke("#{args[:directory]}/StudentMeetings.xml")
  end
  
  task :students, [:file_path] => [:environment] do |t, args|
    # QualStatus:
    #   1 - Needs to take
    #   2 - Passed
    #   3 - Retake one
    #   4 - Retake two
    # QualTest:
    #   Incomplete Tests
    include ActiveSupport::Inflector
    
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["Students"].each do |student|
      next if (student["LastName"].blank? || student["LastName"].blank?)
      new_student = Student.new(
          first_name:           titleize(student["FirstName"]),
          last_name:            titleize(student["LastName"]),
          phone:                student["ContactNumber"].nil? ? nil : student["ContactNumber"].gsub(/[\(\)\s\-]/,""),
          email_1:              student["EmailAddress"],
          email_2:              student["EmailAddress2"],
          year_entered:         student["YearEntered"],
          ms_year:              student["MSYear"],
          phd_year:             student["PhDYear"],
          ms_semester:          student["MSSemester"],
          phd_semester:         student["PhDSemester"],
          panther_id:           student["PantherID"].nil? ? nil : student["PantherID"],
          alt_research_1:       student["AltResearch_1"],
          alt_research_2:       student["AltResearch_2"],
          citi_online:          student["CITIonline"],
          citi_discussion:      student["CITIdiscussion"],
          legacy_id:            student["ID"],
          lab_phone:            student["LabPhone"].nil? ? nil : student["LabPhone"].gsub(/[\(\)\s\-]/,""),
          thesis_ms:            student["ThesisMS"]
        )
        
      if student["MSStudent"] == "1"
        new_student.degree = "Masters"
      else
        new_student.degree = "PhD"
      end
        
      if student["LeftProgramEarly"] == "1"
        new_student.status = "Left program early"
      elsif student["Graduated"] == "1"
        new_student.status = "Graduated"
      else
        new_student.status = "Current student"
      end
      
      puts "Adding #{new_student.last_name}" if new_student.save!
        
      # case student["QualStatus"]
      # when "2"  # Passed everything
      #   student.em = true
      #   student.stat_mech = true
      #   student.quantum = true
      #   student.class_mech = true
      #   student.attempts = 1
      # when "3"
      #   student.em = true
      #   student.stat_mech = true
      #   student.quantum = true
      #   student.class_mech = true
      #   student.attempts = 1
      #   case student["QualTest"] # NEED TO CHECK HOW DR. P WROTE THESE
      #   when ""
      # when 
        
    end
  end
  
  task :professors, [:file_path] => [:environment] do |t, args|
    temp_password = (0...8).map{65.+(rand(25)).chr}.join
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["CommitteeMembers"].each do |professor|
      next if (professor["FirstName"].blank? || professor["LastName"].blank?)
      professor = Professor.new(
          first_name:            professor["FirstName"],
          last_name:             professor["LastName"],
          email:                 professor["Email"] || "update_email_#{professor['ID']}@gsu.edu",
          legacy_id:             professor["ID"],
          password:              temp_password,
          password_confirmation: temp_password
        )        
      puts "Saved #{professor.last_name}" if professor.save!
    end
  end
  
  task :committees, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["Committees"].each do |committee|
      student = Student.find_by_legacy_id(committee["StudentID"])
      professor = Professor.find_by_legacy_id(committee["MemberID"])
      puts "error with student id: #{committee["StudentID"]} and professor id: #{committee["MemberID"]}" if (student.nil? || professor.nil?)
      puts "adding #{professor.full_name} to #{student.full_name}'s committee"
      Committee.create(
        student_id:      student.id,
        professor_id:    professor.id,
        ms_chair:        committee["Chair_MS"],
        phd_chair:       committee["Chair_PhD"],
        ms:              committee["MS"],
        phd:             committee["PhD"]
      )
    end
  end
  
  task :meetings, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["Meetings"].each do |meeting|
      Meeting.create(
        date:       DateTime.strptime(meeting["MeetingDate"], '%Y-%m-%dT%H:%M:%S'),
        legacy_id:  meeting["ID"]
      )
      puts "#{meeting["MeetingDate"]} Added"
    end
  end  
  
  task :student_meetings, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["StudentMeetings"].each do |student_meeting|
      next if student_meeting["MeetingID"].nil? || student_meeting["StudentID"].nil?
      meeting = Meeting.find_by_legacy_id(student_meeting["MeetingID"])
      student = Student.find_by_legacy_id(student_meeting["StudentID"])
      MeetingAttendance.create( student_id: student.id, meeting_id: meeting.id )
      puts "Added a meeting (id: #{meeting.id}) for student (id: #{student.id})"
    end  
  end

  task :test, :message do |t, args|
    puts "Arugments: #{args}"
  end
end
