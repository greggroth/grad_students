class LettersController < ApplicationController
  
  def index
    @department_chair = Professor.where(department_chair: true).first
    @graduate_advisor = Professor.where(graduate_advisor: true).first
    @students = Student.current_students
    if @department_chair.nil? || @graduate_advisor.nil?
      redirect_to professors_path, notice: "Please ensure a graduate director and department chair have been specified and that the student's stipend has been entered."
    else
      render layout: false
    end
  end
  
  def show
    @department_chair = Professor.where(department_chair: true).first
    @graduate_advisor = Professor.where(graduate_advisor: true).first
    @student = Student.find(params[:id])
    if @department_chair.nil? || @graduate_advisor.nil? || !(@student.stipend.present? || @student.externally_supported)
      redirect_to professors_path, notice: "Please ensure a graduate director and department chair have been specified and that the student's stipend has been entered."
    else
      render layout: 'letter'      
    end
  end
end
