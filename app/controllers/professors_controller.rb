class ProfessorsController < ApplicationController
  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.order('last_name')

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
    @professor = Professor.find(params[:id])
    @current_committees = @professor.current_committees.order('students.last_name')
    @past_committees = @professor.past_committees.order('students.last_name')
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /professors/new
  # GET /professors/new.json
  def new
    @password = (0...8).map{65.+(rand(25)).chr}.join
    @professor = Professor.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(params[:professor])

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /professors/1
  # PUT /professors/1.json
  def update
    @professor = Professor.find(params[:id])

    respond_to do |format|
      if @professor.update_without_password(params[:professor])
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to professors_url }
    end
  end
  
  def committees
    @professors = Professor.includes(:students,:committees).order('last_name')
  end
end
