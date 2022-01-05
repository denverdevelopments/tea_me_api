class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :price, :status, :frequency

  belongs_to :tea
  belongs_to :customer
end
