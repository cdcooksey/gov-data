class AddConsumerComplaintZipCodeToConsumerComplaint < ActiveRecord::Migration[5.0]
  def change
    add_column :consumer_complaints, :consumer_complaint_zip_code_id, :uuid
  end
end
