FactoryBot.define do
  factory :consumer_complaint do

    consumer_complaint_company
    consumer_complaint_product
    consumer_complaint_subproduct
    consumer_complaint_issue
    consumer_complaint_subissue
    consumer_complaint_zip_code
    complaint_id                  { Faker::Number.number(4) }
    date_received                 { Faker::Date.between(200.days.ago, Date.today) }
    date_sent_to_company          { Faker::Date.between(200.days.ago, Date.today) }
    timely_response               { [true, false].sample }
    consumer_disputed             { [true, false].sample }
    submitted_via                 { Faker::Lorem.word }
    consumer_complaint_narrative  { Faker::Lorem.word }
    company_public_response       { Faker::Lorem.word }

  end
end
