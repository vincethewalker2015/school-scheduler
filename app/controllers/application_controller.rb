class ApplicationController < ActionController::Base
  helper_method :current_student, :logged_in?

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end 

  def logged_in?
    !!current_student
  end

  def require_user 
    if !logged_in?
      flash[:notice] = "Please log in to view this page"
      redirect_to root_path
    end
  end

  def require_admin
    if !(current_student.admin?)
      flash[:note] = "Admin users only"
      redirect_to root_path
    end
  end
end
