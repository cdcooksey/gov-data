require 'rails_helper'

RSpec.describe ConsumerComplaintSerializer do
  subject { ConsumerComplaintSerializer.new(model).serializable_hash }
  let(:type) { :consumer_complaint }

  describe 'single record' do
    let(:model) { FactoryBot.create(:consumer_complaint) }

    it { is_expected.to eq the_single_record_contract }
  end

  let(:the_single_record_contract) do
    { data: {
        id: model.id.to_s,
        type: type,
        attributes: {
          id: model.id,
          complaint_id: model.complaint_id,
          date_received: model.date_received,
          date_sent_to_company: model.date_sent_to_company,
          timely_response: model.timely_response,
          consumer_disputed: model.consumer_disputed,
          submitted_via: model.submitted_via
        }
      }
    }
  end
end
