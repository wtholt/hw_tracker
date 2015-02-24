require 'rails_helper'

RSpec.describe SubmissionsHelper, type: :helper do 
  subject do 
    Submission.new({
      name: "name",
      description: "description"
      })
  end

  it 'should return default homework state' do 
    expect(helper.submission_workflow(subject)).to eq("review")
  end

  it 'should return default state description' do 
    expect(helper.workflow_state_helper_method(subject)).to eq("Submission is being reviewed")
  end





end