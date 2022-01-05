class TeaSerializer
  include JSONAPI::Serializer
  attributes :id, :variety, :description, :temp, :brew_time
end
