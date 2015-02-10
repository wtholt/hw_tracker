class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find params[:id]
  end

  def edit
    @assignment = Assignment.find params[:id]
  end

  def update
    @assignment = Assignment.find params[:id]
    @assignment.update_attributes assignment_params
    redirect_to assignments_path
  end

  def destroy
    @assignment = Assignment.find params[:id]
    @assignment.destroy
    redirect_to assignments_path
  end

  def create
    @assignment = Assignment.create assignment_params
    redirect_to assignments_path
  end

private
  def assignment_params
    params.require(:assignment).permit(
      :name, 
      :due_date,
    )
  end
end
