require 'rails_helper'
include RandomData

RSpec.describe PostsController do
  let (:my_post) do 
    Post.create(
      id: 1,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
    )
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:posts)).to eq([my_post])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_post.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
      expect(assigns(:post)).to eq(my_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:post)).not_to be_nil
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{ post :create, {post: {title: "Title", body: "Body"}} }.to change(Post,:count).by(1)
    end

    it "assigns Post.last to @post" do
      post :create, {post: my_post.attributes}
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do
      post :create, {post: my_post.attributes}
      expect(response).to redirect_to Post.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_post.id}
      expect(response).to render_template :edit
    end

    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
      expect(assigns(:post)).to eq(my_post)
    end
  end

  describe "PUT update" do
    it "located the requested post" do
      put :update, id: my_post.id, post: {title: "Title2", body: "Body2"}
      expect(assigns(:post)).to eq Post.find(my_post.id)
    end

    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_post.id, post: { title: new_title, body: new_body }
      
      updated_post = assigns(:post)

      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
    end

    it "redirects to the updated contact" do
      put :update, id: my_post.id, post: {title: "Title2", body: "Body2"}
      expect(response).to redirect_to my_post
    end
  end
end
