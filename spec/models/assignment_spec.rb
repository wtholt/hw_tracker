require 'rails_helper'

RSpec.describe Assignment, type: :model do
  subject do 
    Assignment.new({
      name: "name",
      due_date: 2015-01-27,
      description: "description"
      })
  end

  let(:submission) do
    Submission.new({
      name: "name",
      description: "description"
      }) 
  end 

  let(:comment) do 
    Comment.new({
      content: "comment"
      })
  end
  
  it {should belong_to(:user)}
  it {should have_many(:submissions)}
  it {should have_many(:users)}
  it {should have_many(:comments)}

  it "should have submissions" do 
    subject.submissions << submission
    expect(subject.submissions.length).to eq(1)
  end

  it "should have comments" do 
    subject.comments << comment
    expect(subject.comments.length).to eq(1)
  end
end