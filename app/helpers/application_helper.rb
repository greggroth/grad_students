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
end
