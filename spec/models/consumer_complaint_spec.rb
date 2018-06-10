require 'rails_helper'

RSpec.describe ConsumerComplaint, type: :model do
  let(:consumer_complaint) { FactoryBot.create(:consumer_complaint) }

  describe '#consumer_complaint_company' do
    subject { consumer_complaint }
    it { is_expected.to respond_to(:consumer_complaint_company) }
  end
end
