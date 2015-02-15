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
    @links = @submission.links
    authorize! :show, @submission
  end

  def index
    @assignment = Assignment.find params[:assignment_id]
    @submissions = @assignment.submissions
    # authorize! :index, @submissions
  end

  def edit
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    authorize! :update, @submission
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
    authorize! :destroy, @submission
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
    if @comment.save
      UserMailer.comment_email(current_user, @comment).deliver
      UserMailer.submission_user_comment_email(@submission, @comment).deliver
      redirect_to assignment_submission_path(@assignment, @submission)
    else
      render :new
    end
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to assignment_submission_path(@comment.commentable.assignment, @comment.commentable)
  end

  def review_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    authorize! :review, @submission
    @submission.review!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def unfinish_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    authorize! :unfinish, @submission
    @submission.unfinish!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def finish_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    authorize! :finish, @submission
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
