class SessionsController < ApplicationController

  def new
    
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "Log in Successfull"
      redirect_to student
    else
      flash.now[:danger] = "Login Error.."
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You are Logged Out"
    redirect_to root_path
  end
  
  
  
end