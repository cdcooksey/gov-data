class AddConsumerComplaintIssueToConsumerComplaint < ActiveRecord::Migration[5.0]
  def change
    add_column :consumer_complaints, :consumer_complaint_issue_id, :uuid
  end
end
