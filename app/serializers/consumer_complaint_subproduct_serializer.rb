class ConsumerComplaintSubproductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :consumer_complaints
end
