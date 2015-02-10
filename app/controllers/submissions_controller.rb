class SubmissionsController < ApplicationController
  
  def new
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.new
  end

  def show
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @comment = Comment.new
    @comments = @submission.comments
  end

  def index
    @assignment = Assignment.find params[:assignment_id]
    @submissions = @assignment.submissions
  end

  def edit
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
  end

  def update
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @submission.update_attributes submission_params
    redirect_to assignment_submissions_path(@assignment)
  end

  def create
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.create submission_params
    if @submission.save
      flash[:notice] = 'Submission was successfully created.'
      redirect_to assignment_submissions_path(@assignment)
    else
      flash[:error] = 'Submission was not saved!'
      render :new
    end
  end

  def destroy
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @submission.destroy
    respond_to do |format|
      format.html {redirect_to assignment_submissions_path(@assignment), notice: 'Submission deleted.'}
    end
  end

  def create_comment
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @comment = @submission.comments.create comment_params
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def destroy_comment
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to assignment_submission_path(@comment.commentable.assignment, @comment.commentable)
  end

private
  
  def comment_params
    params.require(:comment).permit(
      :content,
    )
  end


  def submission_params
    params.require(:submission).permit(
      :name,
      :description,
    )
  end
end
