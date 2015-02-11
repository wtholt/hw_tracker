module SubmissionsHelper
  def submission_workflow(submission_object)
    submission_object.workflow_state
  end

  def workflow_state_helper_method(submission)
    if submission.workflow_state == "review"
      "Submission is being reviewed"
    elsif submission.workflow_state == "incomplete"
      "Submission is incomplete"
    elsif submission.workflow_state == "complete"
      "Submission is complete"
    end  
  end

  def submission_state?(submission)
    array_of_links = []
    review_links = [
      (link_to "Incomplete", unfinish_submission_assignment_submission_path(@assignment, @submission), method: :patch),
      (link_to "Complete", finish_submission_assignment_submission_path(@assignment, @submission), method: :patch),
    ]
    incomplete_links = [
      (link_to "Review", finish_submission_assignment_submission_path(@assignment, @submission), method: :patch),
      (link_to "Complete", finish_submission_assignment_submission_path(@assignment, @submission), method: :patch),

    ]

    if submission.review?
      array_of_links.push(review_links)
      return array_of_links.join(' | ').html_safe
    elsif submission.incomplete?
      array_of_links.push(incomplete_links)
      return array_of_links.join(' | ').html_safe
    else 
    end
  end



end
