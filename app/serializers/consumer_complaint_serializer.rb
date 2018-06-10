class ConsumerComplaintSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :complaint_id,
             :date_received,
             :date_sent_to_company,
             :timely_response,
             :consumer_disputed,
             :submitted_via
  belongs_to :consumer_complaint_company
end
