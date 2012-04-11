class LettersController < ApplicationController
  def show
    @department_chair = Professor.where(department_chair: true).first
    @graduate_advisor = Professor.where(graduate_advisor: true).first
    @student = Student.find(params[:id])
    if @department_chair.nil? || @graduate_advisor.nil? || @student.stipend.nil?
      redirect_to professors_path, notice: "Please ensure a graduate director and department chair have been specified and that the student's stipend has been entered."
    else
      render layout: 'letter'      
    end
  end
end
