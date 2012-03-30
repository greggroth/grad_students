class Professor < ActiveRecord::Base
  has_many :committees
  has_many :students, through: :committees


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
end
