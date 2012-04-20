class Student < ActiveRecord::Base
  has_one :qualifier, dependent: :destroy
  has_many :committees, dependent: :destroy
  has_many :professors, through: :committees
  # has_and_belongs_to_many :meetings, uniq: true
  has_many :meeting_attendances
  has_many :meetings, through: :meeting_attendances
  accepts_nested_attributes_for :committees, allow_destroy: true, reject_if: proc { |a| a['professor_id'].blank? }
  accepts_nested_attributes_for :qualifier
  
  validates_associated :committees
  validates_presence_of :first_name, :last_name, :degree
  validates_uniqueness_of :last_name, scope: :first_name
  validates_format_of :panther_id, with: /\d\d\d\-\d\d\-\d\d\d\d/, allow_nil: true, allow_blank: true
  validates_numericality_of :stipend, :year_entered, :ms_year, :phd_year, allow_nil: true
  
  before_save :store_stipend_for_graduated_student
  before_create :check_for_qualifier
  
  def to_param
    "#{id} #{full_name}".parameterize
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def committee(options = {})
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
  
  def ms_student?
    degree == "Masters"
  end
  
  def self.current_students
    self.where('status = ?', "Current student")
  end
  
  def self.past_students
    self.where('status != ?', "Current student")
  end
  
  def self.incomplete_qual
    self.joins(:qualifier).where('degree = ? AND (qualifiers.em = false OR qualifiers.quantum = false OR qualifiers.stat_mech = false OR qualifiers.class_mech = false)', "PhD")
  end
  
  def self.incomplete_research(options={})
    case options
    when :ms
      where('degree = ? AND alt_research_1 IS ?', 'Masters', nil)
    when :phd
      where('degree = ? AND (alt_research_1 IS ? OR alt_research_2 IS ?)', 'PhD', nil, nil)
    else
      incomplete_research(:ms) + incomplete_research(:phd)
    end
  end
  
  def self.incomplete_citi
    self.where('citi_online = false OR citi_discussion = false')
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
  
  def tests_passed
    # This doesn't feel right, but I don't have an alternative
    Qualifier.where(student_id: id)
             .select([:em, :stat_mech, :quantum, :class_mech, :biophysics, :astrophysics])
             .collect { |t| [t.em, t.stat_mech, t.quantum, t.class_mech, t.biophysics, t.astrophysics] }
             .first
             .keep_if { |t| t }
             .count
  end
  
  def passed_qualifier?
    tests_passed >= 4
  end
  
  def funding
    return stipend if unique_stipend    
    return nil unless phd_student?
    if passed_qualifier?
      puts "qual"
      Funding.postqual
    else
      Funding.prequal
    end
  end
  
  def current_student?
    status == "Current student"
  end

  
  private
  def check_for_qualifier
    if qualifier.nil?
      build_qualifier
    end
  end
  
  def store_stipend_for_graduated_student
    unless current_student?
      puts "so far so good"
      self.stipend = self.funding
      self.unique_stipend = true
    end
  end
end
