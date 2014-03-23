class Comment
  include ActiveModel::Model
  include CouchRest::Model::Embeddable

  property :user_name
  property :body
  timestamps!
end
