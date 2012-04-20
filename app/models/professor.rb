class Professor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, 
                  :last_name, 
                  :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :department_chair, 
                  :graduate_advisor, 
                  :undergraduate_advisor, 
                  :phone,
                  :legacy_id,
                  :associate_chair,
                  :lab_coordinator
  has_many :committees, dependent: :destroy
  has_many :students, through: :committees
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :last_name, scope: :first_name
  validates_associated :committees

  def to_param
    "#{id} #{full_name}".parameterize
  end

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
  
  def current_committees
    committees.joins(:student).where("students.status = ?", "Current student")
  end
  
  def past_committees
    committees.joins(:student).where("students.status != ?", "Current student")
  end
  
  def admin?
    department_chair || undergraduate_advisor || graduate_advisor || associate_chair
  end
  
end
