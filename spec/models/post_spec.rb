require 'rails_helper'

RSpec.describe Post, type: :model do
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
