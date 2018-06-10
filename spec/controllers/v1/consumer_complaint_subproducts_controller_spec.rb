require 'rails_helper'

RSpec.describe V1::ConsumerComplaintSubproductsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let(:subproduct)    { FactoryBot.create(:consumer_complaint_subproduct) }
    let(:subproduct_id) { subproduct.id }

    before { get :show, params: { id: subproduct_id } }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
  end

end
