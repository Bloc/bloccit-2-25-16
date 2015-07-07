require 'rails_helper'

RSpec.describe Topic, :type => :model do
  let(:topic) { Topic.new(name: "New Topic Name", description: "New Topic Description") }

  it { should have_many(:posts) }

  it "should respond to name" do
    expect(topic).to respond_to(:name)
  end

  it "should respond to description" do
    expect(topic).to respond_to(:description)
  end

  it "should respond to public" do
    expect(topic).to respond_to(:public)
  end

  it "should be public by default" do
    expect(topic.public).to be(true)
  end
end
