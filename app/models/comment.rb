class Comment
  include ActiveModel::Model
  include CouchRest::Model::Embeddable

  property :user_name
  property :body
  timestamps!

  validates_presence_of :user_name, :body
end
