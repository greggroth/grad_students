class Professor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
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
  
  def current_committees
    committees.joins(:student).where("students.status = ?", "Current student")
  end
  
  def past_committees
    committees.joins(:student).where("students.status != ?", "Current student")
  end
  
end
