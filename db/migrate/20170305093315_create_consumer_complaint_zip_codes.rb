class CreateConsumerComplaintZipCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :consumer_complaint_zip_codes, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
