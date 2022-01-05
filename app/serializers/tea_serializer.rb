class TeaSerializer
  include JSONAPI::Serializer
  attributes :id, :type, :description, :temp, :brew_time
end
