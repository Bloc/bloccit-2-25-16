require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:topic) }
  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:body).is_at_least(20) }
  it { should belong_to(:topic) }

  context "attributes" do
    let(:post) { Post.new(title: "New Post Title", body: "New Post Body") }

    it "should respond to title" do
      expect(post).to respond_to(:title)
    end

    it "should assign title properly" do
      expect(post.title).to eql "New Post Title"
    end
    
    it "should respond to body" do
      expect(post).to respond_to(:body)
    end

    it "should assign body properly" do
      expect(post.body).to eql "New Post Body"
    end
    
  end
end
