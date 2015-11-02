class SessionsController < ApplicationController
  def create
  end

  def destroy
  end

  private

   def set_params
     params.require(:session).permit(:name, :email, :password)
   end
end
