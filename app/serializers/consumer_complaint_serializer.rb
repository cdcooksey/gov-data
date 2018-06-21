class ConsumerComplaintSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :complaint_id,
             :date_received,
             :date_sent_to_company,
             :timely_response,
             :consumer_disputed,
             :submitted_via

  attribute :company do |obj|
    obj.consumer_complaint_company.name
  end

  attribute :product do |obj|
    obj.consumer_complaint_product.name
  end

  belongs_to :consumer_complaint_company
  belongs_to :consumer_complaint_product
  belongs_to :consumer_complaint_subproduct
  belongs_to :consumer_complaint_issue
  belongs_to :consumer_complaint_subissue
  belongs_to :consumer_complaint_zip_code
end
