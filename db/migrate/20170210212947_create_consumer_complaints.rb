class CreateConsumerComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :consumer_complaints, id: :uuid do |t|
      t.integer :complaint_id
      t.date :date_received
      t.date :date_sent_to_company
      t.boolean :timely_response
      t.boolean :consumer_disputed
      t.string :submitted_via

      t.timestamps
    end
  end
end
