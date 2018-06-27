require 'rails_helper'

RSpec.describe V1::ConsumerComplaintIssuesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let(:issue)    { FactoryBot.create(:consumer_complaint_issue) }
    let(:issue_id) { issue.id }

    before { get :show, params: { id: issue_id } }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
  end

end
