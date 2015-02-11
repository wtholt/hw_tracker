class SubmissionsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:new, 
    :create, 
    :submission_params, 
    :index, 
    :show,
    :create_comment
  ]

  def new
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.new
  end

  def show
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @comment = Comment.new
    @comments = @submission.comments
    @links = @submission.links
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
    @submission.user = current_user
    @submission.save
    redirect_to assignment_submissions_path(@assignment)
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
    @comment.user = current_user
    @comment.save
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def destroy_comment
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to assignment_submission_path(@comment.commentable.assignment, @comment.commentable)
  end

  def review_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @submission.review!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def unfinish_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @submission.unfinish!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def finish_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @submission.finish!
    redirect_to assignment_submission_path(@assignment, @submission)
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
