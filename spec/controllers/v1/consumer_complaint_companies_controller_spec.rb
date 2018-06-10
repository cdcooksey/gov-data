require 'rails_helper'

RSpec.describe V1::ConsumerComplaintCompaniesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get v1_consumer_complaint_companies_path, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:company)    { FactoryBot.create(:consumer_complaint_company) }
    let(:company_id) { company.id }

    before { get :show, params: { id: company_id } }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
  end


end

