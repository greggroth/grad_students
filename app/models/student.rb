class Student < ActiveRecord::Base
  has_many :committees
  has_many :professors, through: :committees
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def formatted_panther_id
    "#{panther_id.to_s[(0..2)]}-#{panther_id.to_s[(3..4)]}-#{panther_id.to_s[(5..8)]}"
  end
  
  def committee_chair
    professors.where("ms_chair = true OR phd_chair = true")
  end
  
  def phd_committee
    professors.where('ms_chair = false AND phd_chair = false AND phd = true')
  end
  
  def ms_committee
    professors.where('ms_chair = false AND phd_chair = false AND ms = true')
  end
end
