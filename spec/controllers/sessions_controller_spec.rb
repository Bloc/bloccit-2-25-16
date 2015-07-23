require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let (:my_user) do
    User.create(
      id: 1,
      name: "Blochead",
      email: "blochead@bloc.io",
      password: "password",
      password_confirmation: "password"
    )
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST sign_in" do
    it "returns http success" do
      post :create, { session: { email: my_user.email } }
      expect(response).to have_http_status(:success)
    end

    it "does not initialize session" do
      post :create, { session: { email: my_user.email } }
      expect(assigns(:session)).to be_nil
    end

    it "does not initialize session" do
      post :create, { session: { email: my_user.email } }
      expect(assigns(:session)).to be_nil
    end

    it "flashes #danger" do
      post :create, { session: { email: "does not exist" } }
      expect(flash[:danger]).to be_present
    end

    it "renders #new with bad email address" do
      post :create, { session: { email: "does not exist" } }
      expect(response).to render_template :new
    end

    it "renders the #show view" do
      post :create, { session: { email: my_user.email } }
      expect(response).to render_template :new
    end
  end

end
