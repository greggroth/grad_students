class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end
  
  def show
    @meeting = Meeting.find(params[:id])
  end
  
  def new
    @meeting = Meeting.new
  end
  
  def edit
    @meeting = Meeting.find(params[:id])
  end
  
  def create
    students = params[:meeting].delete('students')
    @meeting = Meeting.new(params[:meeting])
    students.each do |student, id|
      @meeting.students << Student.find(id) unless id.blank?
    end
    
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'New meeting was successfully created.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def update
    @meeting = Meeting.find(params[:id])
    
    respond_to do |format|
      if @student.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
  end
end
