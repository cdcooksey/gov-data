class ConsumerComplaintProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :consumer_complaints
end
