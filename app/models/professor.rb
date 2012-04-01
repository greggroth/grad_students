class Professor < ActiveRecord::Base
  has_many :committees, dependent: :destroy
  has_many :students, through: :committees
  validates_presence_of :first_name, :last_name
  validates_associated :committees


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def ms_chaired_committees
    students.where('ms_chair = true')
  end
  
  def phd_chaired_committees
    students.where('phd_chair = true')
  end
  
  def chaired?(student)
    students.where('phd_chair = true OR ms_chair = true').include? student
  end
  
end
