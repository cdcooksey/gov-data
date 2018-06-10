require 'rails_helper'

RSpec.describe V1::ConsumerComplaintSubissuesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do

    let(:subissue)    { FactoryBot.create(:consumer_complaint_subissue) }
    let(:subissue_id) { subissue.id }

    before { get :show, params: { id: subissue_id } }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
  end

end
