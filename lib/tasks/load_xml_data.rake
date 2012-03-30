desc  "Import data to the database from an xml file"
namespace :import do
  task :students, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["Students"].each do |student|
      Student.create(
          first_name:           student["FirstName"],
          last_name:            student["LastName"],
          phone:                student["ContactNumber"].nil? ? nil : student["ContactNumber"].gsub(/[\(\)\s\-]/,""),
          email_1:              student["EmailAddress"],
          email_2:              student["EmailAddress2"],
          year_entered:         student["YearEntered"],
          ms_year:              student["MSYear"],
          phd_year:             student["PhDYear"],
          ms_semester:          student["MSSemester"],
          phd_semester:         student["PhDSemester"],
          panther_id:           student["PantherID"].nil? ? nil : student["PantherID"].gsub(/\-/,""),
          alt_research_1:       student["AltResearch_1"],
          alt_research_2:       student["AltResearch_2"],
          citi_online:          student["CITIonline"],
          citi_discussion:      student["CITIdiscussion"],
          legacy_id:            student["ID"],
          left_program_early:   student["LeftProgramEarly"],
          graduated:            student["Graduated"],
          lab_phone:            student["LabPhone"].nil? ? nil : student["LabPhone"].gsub(/[\(\)\s\-]/,""),
          thesis_ms:            student["ThesisMS"]
        )
    end
  end
  
  task :faculty, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["CommitteeMembers"].each do |professor|
      Professor.create(
          first_name:           professor["FirstName"],
          last_name:            professor["LastName"],
          email:                professor["Email"],
          legacy_id:            professor["ID"]
        )
    end
  end
  
  task :committees, [:file_path] => [:environment] do |t, args|
    doc = Hash.from_xml(File.open(args[:file_path]))
    doc["dataroot"]["Committees"].each do |committee|
      student = Student.find_by_legacy_id(committee["StudentID"])
      professor = Professor.find_by_legacy_id(committee["MemberID"])
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

  task :test, :message do |t, args|
    puts "Arugments: #{args}"
  end
end