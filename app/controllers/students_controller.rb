class StudentsController < ApplicationController
  before_filter :admin_only, only: [:edit, :new, :create, :update, :destroy]
  
  # GET /students
  # GET /students.json
  def index    
    @current_students = Student.current_students.order('last_name')
    @past_students = Student.past_students.order('last_name')
    respond_to do |format|
      format.html
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.includes(:meetings, :qualifier, {:committees => :professor}).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new(ms_year: Time.now.year, phd_year: Time.now.year, status: "Current student")
    @student.build_default_qualifier
    @student.committees.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @student.build_default_qualifier if @student.qualifier.nil?
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  def incomplete_qualifier
    @students = Student.incomplete_qual.order('last_name')
  end
  
  def incomplete_research
    @ms_students = Student.incomplete_research(:ms).order('last_name')
    @phd_students = Student.incomplete_research(:phd).order('last_name')
  end
  
  def incomplete_citi
    @students = Student.current_students.incomplete_citi.order('last_name')
  end
  
  def committees
    @current_students = Student.includes(:committees, :professors).current_students.order('last_name')
    @past_students = Student.includes(:committees, :professors).past_students.order('last_name')
  end
  
  def funding
    data = Student.funding_by_year
    pre_data = Student.funding_by_year(:prequal)
    post_data = Student.funding_by_year(:postqual)
    max = data.map { |i| i[1] }.max + 1000
    min = data.map { |i| i[1] }.min - 1000
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "line"
      f.series(name: "Pre-Qualifier", data: pre_data, color: "#B80332")
      f.series(name: "Post-Qualifier", data: post_data, color: "#3F779A")
      f.xAxis(categories: data.map { |i| i[0].to_s }, title: { text: "Year" })
      f.yAxis(max: max, min: min, title: { text: "Average Stipend" })
      # f.legend(enabled: false)
      f.title(text: "Average Stipend for Internally Supported Students")
    end
  end
  
  private
  def admin_only
    unless current_professor.admin?
      redirect_to :back, notice: "Must be an admin to perform this action"
    end
  end

end
