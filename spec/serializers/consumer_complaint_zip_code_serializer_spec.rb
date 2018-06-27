require 'rails_helper'

RSpec.describe ConsumerComplaintZipCodeSerializer do
  subject { ConsumerComplaintZipCodeSerializer.new(model).serializable_hash }
  let(:type) { :consumer_complaint_zip_code }

  describe 'single record' do
    let(:model) { FactoryBot.create(:consumer_complaint_zip_code) }

    it { is_expected.to eq the_single_record_contract }
  end

  let(:the_single_record_contract) do
    { data: {
        id: model.id.to_s,
        type: type,
        attributes: {
          id: model.id,
          name: model.name
        }
      }
    }
  end
end
