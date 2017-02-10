class CreateConsumerComplaintIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :consumer_complaint_issues, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
