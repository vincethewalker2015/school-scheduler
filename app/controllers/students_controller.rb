class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create 
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      flash[:notice] = "Your Profile is Created"
      redirect_to student_path(@student)
    else
      flash[:notice] = "try that again!"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update 
    if @student.update(student_params)
      flash[:notice] = "Student has been Updated"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  # def destroy
  #   @student.destroy
  #   flash[:notice] = "Student Has been Deleted"
  #   redirect_to categories_path 
  # end

  private

  def student_params 
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student 
    @student = Student.find(params[:id])
  end
end
