class ConsumerComplaint < ApplicationRecord
  belongs_to :consumer_complaint_company
  belongs_to :consumer_complaint_product
  belongs_to :consumer_complaint_subproduct
  belongs_to :consumer_complaint_issue
  belongs_to :consumer_complaint_subissue
end
