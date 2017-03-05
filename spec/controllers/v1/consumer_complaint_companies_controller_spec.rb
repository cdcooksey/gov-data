require 'rails_helper'

RSpec.describe V1::ConsumerComplaintCompaniesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get v1_consumer_complaint_companies_path, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get v1_consumer_complaint_company_url create(:consumer_complaint_company), format: :json
      expect(response).to have_http_status(:success)
    end
  end

end

