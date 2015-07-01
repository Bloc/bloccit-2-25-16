require 'rails_helper'

RSpec.describe TopicsController, :type => :controller do
  let (:my_topic) do 
    Topic.create(
      id: 1,
      name:  RandomData.random_sentence,
      description:   RandomData.random_paragraph
    )
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Topic.all to topic" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end

    describe "POST create" do
      it "increases the number of topics by 1" do
        expect{ post :create, {topic: {name: "Topic Name", description: "Topic Description"}} }.to change(Topic,:count).by(1)
      end

      it "assigns Topic.last to @topic" do
        post :create, {topic: {name: "Topic Name", description: "Topic Description"}}
        expect(assigns(:topic)).to eq Topic.last
      end

      it "redirects to the new topic" do
        post :create, {topic: {name: "Topic Name", description: "Topic Description"}}
        expect(response).to redirect_to Topic.last
      end
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
