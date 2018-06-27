require 'rails_helper'

RSpec.describe ConsumerComplaintProductSerializer do
  subject { ConsumerComplaintProductSerializer.new(model).serializable_hash }
  let(:type) { :consumer_complaint_product }

  describe 'single record' do
    let(:model) { FactoryBot.create(:consumer_complaint_product) }

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
