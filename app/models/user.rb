class User < CouchRest::Model::Base
  include ActiveModel::SecurePassword

  property :name,               String
  property :slug,               String
  property :email,              String
  property :twitter,            String
  property :password_digest,    String
  property :confirmation_token, String

  has_secure_password

  design do
    view :by_email
    view :by_slug
  end

  before_create :set_slug

  def to_param
    slug
  end

  def forgot_password!
    generate_confirmation_token
    save
  end

  private

  def set_slug
    self.slug = name.parameterize
  end

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex(20).encode('UTF-8')
  end
end
