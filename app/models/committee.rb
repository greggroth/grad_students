class Committee < ActiveRecord::Base
  validates_presence_of :professor_id, :student_id
  validate :ms_or_phd_selected?
  
  belongs_to :professor
  belongs_to :student
  
  private
  def ms_or_phd_selected?
    unless ms || phd
      errors[:base] <<  "must select either MS or PhD"
    end
  end
end
