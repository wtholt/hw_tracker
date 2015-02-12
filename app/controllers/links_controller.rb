class LinksController < ApplicationController
  def new
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.new
  end

  def index
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @links = @submission.links
  end

  def show
    @link = Link.find params[:id]
  end

  def edit
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]
  end

  def create
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.create link_params
    @link.save
    redirect_to assignment_submission_links_path(@assignment, @submission)
  end

  def destroy
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]
    @link.destroy
    redirect_to assignment_submission_links_path(@assignment, @submission)
  end

  def update
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]
    @link.update_attributes link_params
    redirect_to assignment_submission_link_path(@assignment, @submission, @link)
  end

private
  def link_params
    params.require(:link).permit(
      :url,
      :submission_id,
      :user_id
    )
  end



end
