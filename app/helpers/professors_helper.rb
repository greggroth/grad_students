module ProfessorsHelper
  
  def job_title(professor)
    if professor.graduate_advisor
      "Graduate Advisor"
    elsif professor.undergraduate_advisor
      "Undergraduate Advisor"
    elsif professor.department_chair
      "Department Chair"
    end
  end
  
end
