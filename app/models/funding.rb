class Funding < ActiveRecord::Base
  validates_presence_of :source, :amount
  validates_uniqueness_of :source
  validates_numericality_of :amount
  
  def self.prequal
    where(source: "PhD: Pre-Qualifier")[0].amount
  end
  
  def self.postqual
    where(source: "PhD: Post-Qualifier")[0].amount
  end
  
  def self.ms
    where(source: "MS")[0].amount
  end
end
