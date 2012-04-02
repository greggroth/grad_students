module ApplicationHelper
  
  def committee_type(committee)
    if committee.ms && committee.phd
      "Both"
    elsif committee.ms
      "MS"
    elsif committee.phd
      "PhD"
    else
      "Bad Record"
    end
  end

  def formatted_degree(student)
    if @student.degree == "MS" && @student.thesis_ms
      "Masters student"
    elsif @student.degree == "MS" && !@student.thesis_ms
      "Non-thesis Masters student"
    elsif @student.degree == "PhD"
      "PhD Student"
    end
  end
end
