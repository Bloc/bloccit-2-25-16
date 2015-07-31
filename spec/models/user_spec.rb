require 'rails_helper'
include RandomData

RSpec.describe User, :type => :model do
  let(:other_user) { User.create!(name: RandomData.random_name, email: RandomData.random_email, password: "helloworld") }
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:users_post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: u) }
  let(:other_users_post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: other_user) }

  it { should have_many(:posts)}

  # Shoulda tests for name
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }

  # Shoulda tests for email
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }

  # Shoulda tests for password
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }

  context "attributes" do
    it "should respond to name" do
      expect(u).to respond_to(:name)
    end

    it "should respond to email" do
      expect(u).to respond_to(:email)
    end
<<<<<<< HEAD
=======

    it "should be a member by default" do
      expect(u.member?).to be(true)
    end
>>>>>>> Start writing specs for phase 1
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
    let(:user_with_invalid_email_format) { User.new(name: "Bloccit User", email: "invalid_format") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should be an invalid user due to incorrectly formatted email address" do
      expect(user_with_invalid_email_format).to_not be_valid
    end
  end

  describe "#can_update_or_delete_post?" do
    context "user with member role" do
      it "should return true for a post the user created" do
        expect(u.can_update_or_delete_post?(users_post)).to be_truthy
      end

      it "should return false for a post the user didn't create" do
        expect(u.can_update_or_delete_post?(other_users_post)).to be_falsey
      end
    end

    context "user with admin role" do
      before do
        u.admin!
      end

      it "should return true for a post the user created" do
        expect(u.can_update_or_delete_post?(users_post)).to be_truthy
      end

      it "should return true for a post the user didn't create" do
        expect(u.can_update_or_delete_post?(other_users_post)).to be_truthy
      end
    end
  end
end
