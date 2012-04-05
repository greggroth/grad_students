class Meeting < ActiveRecord::Base
  has_many :meeting_attendances
  has_many :students, through: :meeting_attendances
  # has_and_belongs_to_many :students, uniq: true
  validates_presence_of :date
  
  def to_param
    "#{id} #{date.strftime("%b-%d-%y-%H%M")}".parameterize
  end
end
