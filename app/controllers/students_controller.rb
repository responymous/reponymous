class StudentsController < ApplicationController
  before_action :teachers_only
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students =  Student.where(teacher_id: @current_user)
  end

  # GET /students/1
  def show
    @student = Student.find(params[:id])
    # @average = Score.where(student_id: @current_user)
    # @thingy = Score.average
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @score = Student.find_by(params[:id])
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      if @current_user.is_a?(Teacher)
        redirect_to students_path, notice: 'Student was successfully updated.'
      else
        redirect_to student_dashboard_path
      end
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :teacher_id, :score)
    end
end
