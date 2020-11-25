class CoursesController < ApplicationController
  skip_before_action :require_user
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create 
    @course = Course.new(course_params)
    @course.student = current_student
    if @course.save
      flash[:notice] = "Course Added"
      redirect_to course_path(@course)
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
    if @course.update(course_params)
      flash[:notice] = "Course has been Updated"
      redirect_to course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = "Course Has been Deleted"
    redirect_to courses_path 
  end

  private

  def course_params 
    params.require(:course).permit(:short_name, :name, :description)
  end

  def set_course 
    @course = Course.find(params[:id])
  end

  
end
