require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "attributes" do
     let(:post) { Post.new(title: "New Post Title", body: "New Post Body") }
     let(:comment) { Comment.new(body: 'Comment Body', post: post) }

     it "should respond to body" do
       expect(comment).to respond_to(:body)
     end
   end
end
