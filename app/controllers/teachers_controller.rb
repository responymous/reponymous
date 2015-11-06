class TeachersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def new
    @teacher = Teacher.new
     @teacher = Teacher.find(session[:user_id])
  end

  # POST /teacher
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to teacher_dashboard_path, notice: 'teacher was successfully created.'
    else
      render :new
    end
  end


  def update
    if @teacher.update(teacher_params)
      if @current_user.is_a?(Student)
        redirect_to teachers_path, notice: 'Teacher was successfully updated.'
      else
        redirect_to teacher_dashboard_path
      end
    else
      render :edit
    end
  end


  def show
    @score_average = Student.score_avg
    # @reset = Student.reset_score
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

    def allow_access?
    # authorizes teachers to access desired pages
      unless session[:user_type]=="teacher" && session[:user_id] == @teacher.id
        redirect_to login_path, notice: "You don't have access to this"
      end
    end

    def teacher?
    # authorizes teachers to access desired pages
      unless session[:user_type]=="teacher"
        redirect_to login_path, notice: "You don't have access to this"
      end
    end
end
