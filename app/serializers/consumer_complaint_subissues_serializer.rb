class ConsumerComplaintSubissuesSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :consumer_complaints
end
