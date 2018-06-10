require 'rails_helper'

RSpec.describe V1::ConsumerComplaintProductsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let(:product)    { FactoryBot.create(:consumer_complaint_product) }
    let(:product_id) { product.id }

    before { get :show, params: { id: product_id } }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
  end

end
