class Student < ActiveRecord::Base
  has_one :qualifier
  has_many :committees, dependent: :destroy
  has_many :professors, through: :committees
  accepts_nested_attributes_for :committees, allow_destroy: true
  accepts_nested_attributes_for :qualifier
  validates_associated :committees
  validates_presence_of :first_name, :last_name, :degree
  validate :left_early_or_graduated
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def committee(options = {})
    # puts options.has_key? :ms
    case options
    when :ms
      professors.where('ms = true')
    when :phd
      professors.where('phd = true')
    when :ms_chair
      professors.where("ms_chair = true")
    when :phd_chair
      professors.where("phd_chair = true")
    when :ms_members
      professors.where('ms_chair = false AND ms = true')
    when :phd_members
      professors.where('phd_chair = false AND phd = true')
    end
  end
  
  def phd_student?
    degree == "PhD"
  end
  
  def self.current_students
    self.where('status = ?', "Current student")
  end
  
  def self.past_students
    self.where('status != ?', "Current student")
  end
  
  def build_default_qualifier
    self.build_qualifier do |t|
      t.em = false
      t.stat_mech = false
      t.class_mech = false
      t.quantum = false
      t.attempts = 0
      t.student_id = self.id
    end
  end
  
  private
  def left_early_or_graduated
    if left_program_early && graduated
      errors[:base] <<  "can not be set as left early and graduated"
    end
  end
end
