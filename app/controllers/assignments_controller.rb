class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find params[:id]
    @comment = Comment.new
    @comments = @assignment.comments
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
    @assignment.user = current_user
    @assignment.save
    redirect_to assignments_path
  end

  def create_comment
    @assignment = Assignment.find params[:id]
    @comment = @assignment.comments.create comment_params
    @comment.user = current_user
    @comment.save
    redirect_to assignment_path(@assignment)
  end

  def destroy_comment
    @assignment = Assignment.find params[:id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.commentable
  end

private
  def assignment_params
    params.require(:assignment).permit(
      :name, 
      :due_date,
    )
  end

  def comment_params
    params.require(:comment).permit(
      :content,
    )
  end
end
