require 'spec_helper'

describe Student do
  fixtures :fundings
  
  it "automatically creates a qualifier for a student on create" do
    student = FactoryGirl.create(:student)
    assert_instance_of Qualifier, student.qualifier
  end
  
  it "check a students degree" do
    student = FactoryGirl.create(:student, degree: "PhD")
    assert student.phd_student?
    assert !student.ms_student?
  end
  
  it "returns current students" do
    FactoryGirl.create_list :student, 5, :graduated
    FactoryGirl.create_list :student, 5, :left_early
    current_students = FactoryGirl.create_list :student, 5, :current
    assert_equal Student.current_students, current_students
  end
  
  it "sets a student as graduated" do
    student = FactoryGirl.create(:student)
    student.set_graduated!
    assert_equal student.status, "Graduated"
  end
  
  it "saves the old stipend when a student is mark as graduated" do
    student = FactoryGirl.create(:student)
    old_funding = student.funding
    student.set_graduated!
    new_funding = Funding.where(source: "PhD: Pre-Qualifier").first
    new_funding.amount = 100
    new_funding.save!
    assert_equal student.funding, old_funding
    assert student.unique_stipend
    assert_not_equal student.funding, new_funding.amount
  end
  
end