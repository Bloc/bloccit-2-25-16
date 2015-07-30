require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let (:my_user) do
    User.create(
      id: 1,
      name: "BlocHead",
      email: "Blochead@Bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
      )
  end

  let (:new_user_attributes) do
    {
      name: my_user.name,
      email: my_user.email,
      password: my_user.password,
      password_confirmation: my_user.password_confirmation
    }
  end

  let (:my_second_user) do
    User.create(
      id: 1,
      name: "BlocHead",
      email: "Blochead2@Bloc.io",
      password: "blochead",
      password_confirmation: "blochead"
      )
  end

  let (:new_second_user_attributes) do
    {
      name: my_second_user.name,
      email: my_second_user.email,
      password: my_second_user.password,
      password_confirmation: my_second_user.password_confirmation
    } 
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "returns http success" do
      post :create, user: new_second_user_attributes
    	expect(response).to have_http_status(:success)
    end
    
    it "creates a new User" do
      expect{
        post :create, user: new_user_attributes
      }.to change(User, :count).by(1)
    end

    it "sets User.name properly" do
      post :create, user: new_second_user_attributes
      expect(assigns(:user).name).to eq my_second_user.name
    end

    it "sets User.email properly" do
      post :create, user: new_second_user_attributes
      expect(assigns(:user).email).to eq my_second_user.email
    end

    it "sets User.password properly" do
      post :create, user: new_second_user_attributes
      expect(assigns(:user).password).to eq my_second_user.password
    end

    it "sets User.password_confirmation properly" do
      post :create, user: new_second_user_attributes
      expect(assigns(:user).password_confirmation).to eq my_second_user.password_confirmation
    end
  end
end
