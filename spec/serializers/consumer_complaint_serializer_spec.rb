require 'rails_helper'

RSpec.describe ConsumerComplaintSerializer do
  subject { ConsumerComplaintSerializer.new(model).serializable_hash }

  describe 'single record' do
    let(:model) { FactoryBot.create(:consumer_complaint) }

    it { is_expected.to eq(the_single_record_contract) }
  end

  let(:the_single_record_contract) do
    { data: {
        id: model.id.to_s,
        type: :consumer_complaint,
        attributes: {
          id: model.id,
          complaint_id: model.complaint_id,
          date_received: model.date_received,
          date_sent_to_company: model.date_sent_to_company,
          timely_response: model.timely_response,
          consumer_disputed: model.consumer_disputed,
          submitted_via: model.submitted_via,
          company: model.consumer_complaint_company.name
        },

        relationships: {

          consumer_complaint_company: {
            data: {
              id: model.consumer_complaint_company.id,
              type: :consumer_complaint_company
            }
          },

          consumer_complaint_product: {
            data: {
              id: model.consumer_complaint_product.id,
              type: :consumer_complaint_product
            }
          },

          consumer_complaint_subproduct: {
            data: {
              id: model.consumer_complaint_subproduct.id,
              type: :consumer_complaint_subproduct
            }
          },

          consumer_complaint_issue: {
            data: {
              id: model.consumer_complaint_issue.id,
              type: :consumer_complaint_issue
            }
          },

          consumer_complaint_subissue: {
            data: {
              id: model.consumer_complaint_subissue.id,
              type: :consumer_complaint_subissue
            }
          },

          consumer_complaint_zip_code: {
            data: {
              id: model.consumer_complaint_zip_code.id,
              type: :consumer_complaint_zip_code
            }
          }

        }
      }
    }
  end
end
