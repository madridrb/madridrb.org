class User < CouchRest::Model::Base
  include ActiveModel::SecurePassword

  property :name,            String
  property :slug,            String
  property :email,           String
  property :twitter,         String
  property :password_digest, String

  has_secure_password

  design do
    view :by_slug
  end

  before_create :set_slug

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
