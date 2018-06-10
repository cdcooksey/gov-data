require 'rails_helper'

RSpec.describe V1::ConsumerComplaintsController, type: :controller do

  let(:actual) { JSON.parse(response.body) }
  subject { actual }

  describe 'GET /v1/consumer-complaints' do
    before do
      consumer_complaints
      action
    end

    let(:consumer_complaints) { FactoryBot.create_list(:consumer_complaint, 100) }
    let(:expected_payload) do
      JSON.parse(ConsumerComplaintSerializer.new(expected_consumer_complaints).serialized_json)
    end

    context 'without page param' do
      let(:action) { get :index }
      let(:expected_consumer_complaints) { consumer_complaints.first(50) }

      it { expect(response).to have_http_status :ok }
      it { is_expected.to eq(expected_payload) }
    end
  end
end
