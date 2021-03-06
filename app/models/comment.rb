class Comment
  include ActiveModel::Model
  include CouchRest::Model::Embeddable

  property :user_id
  property :user_name
  property :body
  property :created_at

  validates_presence_of :user_id, :user_name, :body

  def user
    @user ||= User.find(user_id)
  end
end
