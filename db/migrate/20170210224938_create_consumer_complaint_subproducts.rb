class CreateConsumerComplaintSubproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :consumer_complaint_subproducts, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
