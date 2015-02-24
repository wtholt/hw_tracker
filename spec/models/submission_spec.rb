require 'rails_helper'

RSpec.describe Submission, type: :model do 
  subject do 
    Submission.new({
      name: "name",
      description: "description"
      })
  end

  let(:comment) do 
    Comment.new({
      content: "Comment"
      })
  end

  let(:link) do 
    Link.new({
      url: "www.facebook.com"
      })
  end


  it{should belong_to(:user)}
  it{should belong_to(:assignment)}
  it{should have_many(:comments)}
  it{should have_many(:links)}
  it{should accept_nested_attributes_for(:links)}

  it "should start in review" do 
    expect(subject.current_state).to eq("review")
  end

  it "should be able to transition to three states from review" do 
    expect(subject.current_state.events.keys).to eq([
      :review,
      :unfinish,
      :finish
      ])
  end

  it "should be able to transition to two states from incomplete" do 
    subject.save
    subject.unfinish!
    expect(subject.current_state.events.keys).to eq([
      :review,
      :finish
    ])
  end

  it "should have comments" do 
    subject.comments << comment
    expect(subject.comments.length).to eq(1)
  end

  it "should have links" do 
    subject.links << link
    expect(subject.links.length).to eq(1)
  end






end