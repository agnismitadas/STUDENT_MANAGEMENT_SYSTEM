class CoursesController < ActionController::Base
  layout 'application'
  
      def index
        @courses = Course.all
      end
    
      def new
        @course = Course.new
      end
    
      def create
        @course = Course.new(course_params)
        if @course.save
          redirect_to courses_path , notice: 'Course has successfully created'
        else
          render :new
        end
      end
    
      def show
        @course = Course.find(params[:id])
      end
    
      def edit
        @course = Course.find(params[:id])
      end
    
      def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
          redirect_to course_path(@course), notice: 'Course has successfully updated'
        else
          render :edit
        end
      end 
    
      def destroy
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to student_path, notice: 'Course has successfully deleted.'
      end
      
    
      private
    
      def course_params
        params.require(:course).permit(:name, :description, student_ids: [])
      end
end
