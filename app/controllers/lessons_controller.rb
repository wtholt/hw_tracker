class LessonsController < ApplicationController
  
  def new
    @lesson = Lesson.new
  end

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def create
    @lesson = Lesson.create lesson_params
    redirect_to lessons_path
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    @lesson.update_attributes lesson_params
    redirect_to lessons_path
  end

  def destroy
    @lesson = Lesson.find params[:id]
    @lesson.destroy
    redirect_to lessons_path
  end

private
  def lesson_params
    params.require(:lesson).permit(
      :name,
      :description,
      location_ids: [],
    )
  end
end
