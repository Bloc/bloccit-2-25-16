require 'rails_helper'

RSpec.describe Post, type: :model do
  context "attributes" do
    let(:post_title) { "New Post Title" }
    let(:post) { Post.new(title: "#{post_title}", body: "New Post Body") }

    it "should respond to title" do
      expect(post).to respond_to(:title)
      expect(post.title).to eql "#{post_title}"
    end
    
    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
    
  end
end
