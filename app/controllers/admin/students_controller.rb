class Admin::StudentsController < ApplicationController

  def index
    @q= Student.ransack(params[:q])
    @students = @q.result(distinct: true)
    
  end

  def new
    @student = Student.new
    @all_courses = Course.all
    @all_projects = Project.all
  end
  

  def create
    @student = Student.new(student_params)
    @all_courses = Course.all
    if @student.save
      redirect_to admin_students_path , notice: 'Student has successfully created'
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    @all_courses = @student.courses
    @all_projects = @student.projects

  end

  def edit
    @student = Student.find(params[:id])
    @all_courses = Course.all
    @all_projects = Project.all
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_student_path(@student), notice: 'Student has successfully updated'
    else
      render :edit
    end
  end 

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_path, notice: 'Student has successfully deleted.'
  end
  

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :address, :dateOfbirth, :phonenumber,:profile_image ,course_ids: [],project_ids: [])
  end

  end