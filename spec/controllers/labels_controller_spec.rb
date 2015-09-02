require 'rails_helper'

RSpec.describe LabelsController, type: :controller do

  let(:my_label) { Label.create!(name: "L1") }

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, { id: my_label.id }
      expect(response).to render_template :show
    end
  end
end
