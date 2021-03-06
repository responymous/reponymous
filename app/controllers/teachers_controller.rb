class TeachersController < ApplicationController
  before_action :teachers_only, except: [:new, :create]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teacher = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  # POST /teacher
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to teacher_dashboard_path, notice: 'Teacher was successfully created.'
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
    # @average = Score.score.average[1]
    # @score_average = Student.score.score_avg
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
      params.require(:teacher).permit(:name, :email, :password, :current_topic_id)
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
