require 'rails_helper'
include RandomData

RSpec.describe Comment, type: :model do
  context "attributes" do
    let(:topic) { create(:topic) }
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

    it { should belong_to(:post) }
    it { should belong_to(:user) }

    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(5) }

    it "should respond to body" do
      expect(comment).to respond_to(:body)
    end
  end
end
