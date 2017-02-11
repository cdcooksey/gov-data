class AddCompanyPublicResponseToConsumerComplaint < ActiveRecord::Migration[5.0]
  def change
    add_column :consumer_complaints, :company_public_response, :text
  end
end
