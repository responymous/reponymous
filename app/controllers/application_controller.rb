class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def log_in(user)
    session[:user_id] = user.id
    session[:user_type] = user.class.to_s
  end

  private def teachers_only
    unless current_user && session[:user_type] == "Teacher"
      redirect_to login_path, notice: "Please Log In as a Teacher."
      false
    end
  end

  private def students_only
    unless current_user && session[:user_type] == "Student"
      redirect_to login_path, notice: "Please Log In as a Student."
      false
    end
  end

  private def current_user
    return @current_user if @current_user
    if session[:user_type] == "Teacher"
      @current_user = Teacher.find_by_id(session[:user_id])
    elsif session[:user_type] == "Student"
      @current_user = Student.find_by_id(session[:user_id])
    end
  end
end
