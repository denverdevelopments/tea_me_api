class CustomerSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address, :id

  # has_many :items
  # has_many :invoices
end
