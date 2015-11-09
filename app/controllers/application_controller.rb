class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
    session[:user_type] = user.class.to_s
  end

  def logged_in?
    if session[:user_type] == "Teacher"
      @current_user = Teacher.find_by_id(session[:user_id])
    elsif session[:user_type] == "Student"
      @current_user = Student.find_by_id(session[:user_id])
    else
      redirect_to login_path, notice: "Please Log In."
      false
    end
  end
end
