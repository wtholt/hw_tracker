class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def create
    @location = Location.new(location_params)
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    @location.update_attributes(location_params)
  end

  def destroy
    @location = Location.find params[:id]
    @location.destroy!
  end

  def new_form
  end

  private

  def location_params
    params.require(:location).permit(:name, :address)
  end




end
