module ProfessorsHelper
  
  def job_title(professor)
    if professor.graduate_advisor
      "Graduate Advisor"
    elsif professor.undergraduate_advisor
      "Undergraduate Advisor"
    elsif professor.department_chair
      "Department Chair"
    elsif professor.associate_chair
      "Associate Chair"
    end
  end
  
end
