FactoryGirl.define do
  factory :consumer_complaint do
    complaint_id 1
    date_received "2017-02-10"
    date_sent_to_company "2017-02-10"
    timely_response false
    consumer_disputed false
    submitted_via "MyString"
  end
end
