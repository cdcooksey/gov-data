# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# Cunsomer Complaints tables
CSV.foreach("#{Rails.root}/lib/seeds/consumer_complaints.csv", :headers => true) do |row|

  cc = ConsumerComplaint.new

  cc.complaint_id = row['Complaint ID']
  cc.date_received = row['Date received']
  cc.date_sent_to_company = row['Date sent to company']
  cc.submitted_via = row['Submitted via']

  cc.consumer_complaint_company = ConsumerComplaintCompany.find_or_create_by(name: row['Company'])
  cc.consumer_complaint_product = ConsumerComplaintProduct.find_or_create_by(name: row['Product'])
  cc.consumer_complaint_subproduct = ConsumerComplaintSubproduct.find_or_create_by(name: row['Sub-product'])
  cc.consumer_complaint_issue = ConsumerComplaintIssue.find_or_create_by(name: row['Issue'])
  cc.consumer_complaint_subissue = ConsumerComplaintSubissue.find_or_create_by(name: row['Sub-issue'])
  cc.consumer_complaint_zip_code = ConsumerComplaintZipCode.find_or_create_by(name: row['ZIP code'])

  cc.consumer_disputed = if row['Consumer disputed?'] === 'yes'.downcase
                           true
                         else
                           false
                         end
  cc.timely_response = if row['Timely response?'] === 'yes'.downcase
                         true
                       else
                         false
                       end
  cc.save

end