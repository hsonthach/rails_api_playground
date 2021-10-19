class PostSerializer
  include JSONAPI::Serializer
  singleton_class.include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :upvote_count, :created_at
  has_one :subreddit
  has_one :user
  attribute :file_url do |object|
    rails_blob_url(object.file) if object.file.attached?
  end
end
