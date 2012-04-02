class Meeting < ActiveRecord::Base
  has_and_belongs_to_many :students, uniq: true
  validates_presence_of :date
end
