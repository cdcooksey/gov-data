class ConsumerComplaintSerializer < ActiveModel::Serializer
  attributes :id, :complaint_id, :date_received, :date_sent_to_company, :timely_response, :consumer_disputed, :submitted_via, :company_name, :company_id

  def company_name
    object.consumer_complaint_company.name
  end

  def company_id
    object.consumer_complaint_company.id
  end

  belongs_to :consumer_complaint_company
  belongs_to :consumer_complaint_product
  belongs_to :consumer_complaint_subproduct
  belongs_to :consumer_complaint_issue
  belongs_to :consumer_complaint_subissue
end
