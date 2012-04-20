class LettersController < ApplicationController  
  
  def index
    @department_chair = Professor.where(department_chair: true).first
    @graduate_advisor = Professor.where(graduate_advisor: true).first
    @lab_coordinator = Professor.where(lab_coordinator: true).first
    @students = Student.current_students
    if @department_chair.nil? || @graduate_advisor.nil? || @lab_coordinator.nil?
      redirect_to :back, notice: "Please ensure a department chair, graduate director and lab coordinator have been specified and that the student's stipend has been entered."
    else
      render layout: false
    end
  end
  
  def show
    @department_chair = Professor.where(department_chair: true).first
    @graduate_advisor = Professor.where(graduate_advisor: true).first
    @lab_coordinator = Professor.where(lab_coordinator: true).first
    @student = Student.find(params[:id])
    if @department_chair.nil? || @graduate_advisor.nil? || @lab_coordinator.nil?
      redirect_to :back, notice: "Please ensure a department chair, graduate director and lab coordinator have been specified and that the student's stipend has been entered."
    else
      render layout: 'letter'      
    end
  end
end
