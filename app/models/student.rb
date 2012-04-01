class Student < ActiveRecord::Base
  has_many :committees, dependent: :destroy
  has_many :professors, through: :committees
  accepts_nested_attributes_for :committees, allow_destroy: true
  validates_associated :committees
  validates_presence_of :first_name, :last_name, :degree
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def formatted_panther_id
    "#{panther_id.to_s[(0..2)]}-#{panther_id.to_s[(3..4)]}-#{panther_id.to_s[(5..8)]}"
  end
  
  def ms_committee_chair
    professors.where("ms_chair = true")
  end
  
  def phd_committee_chair
    professors.where("phd_chair = true")
  end
  
  def phd_committee
    professors.where('ms_chair = false AND phd_chair = false AND phd = true')
  end
  
  def ms_committee
    professors.where('ms_chair = false AND phd_chair = false AND ms = true')
  end
  
  def phd_student?
    degree == "PhD"
  end
end
