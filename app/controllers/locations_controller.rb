class LocationsController < ApplicationController
  def index
    @locations = Location.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @location = Location.new
    @lessons = Lesson.all
  end

  def select
    @user = current_user
    @locations = Location.all
  end

  def show
    @location = Location.find params[:id]
    @lessons = @location.lessons
  end

  def create
    @location = Location.create(location_params)
    redirect_to locations_path
  end

  def edit
    @location = Location.find params[:id]
    @lessons = Lesson.all
  end

  def update
    @location = Location.find params[:id]
    @location.update_attributes(location_params)
    redirect_to locations_path
  end

  def destroy
    @location = Location.find params[:id]
    @location.destroy!
    redirect_to locations_path
  end

  def new_form
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      lesson_ids: []
    )
  end




end
