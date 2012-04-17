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
    if student.degree == "Masters" && student.thesis_ms
      "Masters student"
    elsif student.degree == "Masters" && !student.thesis_ms
      "Non-thesis Masters student"
    elsif student.degree == "PhD"
      "PhD Student"
    end
  end
  
  def display_date(date)
    date.strftime("%B %e %Y at %l:%M%p")
  end
  
  def ok_or_not_ok(truthy)
    if truthy
      "<i class='icon-ok' />"
    else
      "<i class='icon-remove' />"
    end
  end
  
  def clean_params(params)
    params.delete("controller")
    params.delete("action")
    params.delete("id")
    params
  end
  
  def salutation(student)
    return "Mr." if student.sex == "Male"
    return "Ms." if student.sex == "Female"
    "Mr."
  end
end
