require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user) }

  it { should have_many(:labelings) }
  it { should have_many(:labels).through(:labelings) }

  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should belong_to(:topic) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:topic) }
  it { should validate_presence_of(:user) }
  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:body).is_at_least(20) }

  context "attributes" do

    it "should respond to title" do
      expect(post).to respond_to(:title)
    end

    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end

  describe "voting" do
    before do
      3.times { post.votes.create!(value: 1) }
      2.times { post.votes.create!(value: -1) }
    end

    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect( post.up_votes ).to eq(4)
      end
    end

    describe "#down_votes" do
      it "counts the number of votes with value = -1" do
        expect( post.down_votes ).to eq(2)
      end
    end

    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect( post.points ).to eq(2) # 3 - 2
      end
    end
  end

  describe "#create_vote" do
    let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
    let(:user) { User.create!(name: RandomData.random_name, email: RandomData.random_email, password: "helloworld") }
    let(:post) { Post.new(title: RandomData.random_sentence, body: RandomData.random_paragraph, topic: topic, user: user) }

    it "sets the post up_votes value to 1" do
      post.save
      expect(post.up_votes).to eq (1)
    end

    it "sets the post down_votes value to 0" do
      post.save
      expect(post.down_votes).to eq (0)
    end

    it "sends an email to the owner of the post" do
      expect(post).to receive(:create_vote)
      post.save
    end

    it "associates the vote with the owner of the post" do
      expect(vote.user).to eq (post.user)
    end
  end
end
