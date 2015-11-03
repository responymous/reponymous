class SessionsController < ApplicationController

  def new
  end

  def create
   # Search for user in databases. One of these will fill with information, the other two will be nil.
   t = Teacher.find_by_email(params[:email])
   s = Student.find_by_email(params[:email])

   # Check the above variables to see which user type we are dealing with and then populate session variables.
   if t && t.authenticate(params[:password])
     log_in t
     redirect_to teacher_dashboard_path, notice: "You have been successfully logged in."
   elsif s && s.authenticate(params[:password])
     log_in s
     redirect_to student_dashboard_path, notice: "You have been successfully logged in."
   else
     # If user is not found, redirect to login page.
     # redirect_to login_path, notice: "Email/password incorrect.  Please try again or create a new account."
     flash[:notice] = 'Invalid email/password combination' # Not quite right!
     render 'new'
   end
 end

  def destroy
   session[:user_id] = nil
   session[:login] = nil
   session[:name] = nil
   session[:user_type] = nil
   redirect_to login_path, notice: "You have been logged out!"
  end

  private

   def set_params
     params.require(:session).permit(:name, :email, :password)
   end
end
