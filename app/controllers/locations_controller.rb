class LocationsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
  def index
    @locations = Location.all
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
