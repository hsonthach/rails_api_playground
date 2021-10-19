class SubredditSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :following
end
