require 'rails_helper'
include RandomData

RSpec.describe PostsController, :type => :controller do
  let(:post_title) { RandomData.random_sentence }
  let(:post_body) { RandomData.random_paragraph }
  let (:post) { 
    Post.new(
      id: 1,
      title:  "#{post_title}",
      body:   "#{post_body}"
    )
  }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {:id => '1'}
      expect(response).to have_http_status(:success)
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "test create" do
    it "tests Post instantiation" do
      attrs = FactoryGirl.attributes_for(:post)
      post :create, post: attrs
      expect(:post.id).to eq new_post.id
      expect(:post.title).to eq new_post.title
      expect(:post.body).to eq new_post.body
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {:id => '1'}
      expect(response).to have_http_status(:success)
      expect(assigns(:post)).not_to be_nil
    end
  end

end
