class TeachersController < ApplicationController
  before_action :logged_in?
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def new
    @teacher = Teacher.new
  end

  # POST /teacher
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher, notice: 'teacher was successfully created.'
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teacher_dashboard_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def show
    # @score_average = Student.score_avg
  end

  def edit
    @teacher = Teacher.find(params[:id])

  end


  # DELETE /students/1
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password)
    end
end
