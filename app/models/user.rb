class User < CouchRest::Model::Base
  include ActiveModel::SecurePassword

  property :name,               String
  property :email,              String
  property :twitter,            String
  property :password_digest,    String
  property :confirmation_token, String

  has_secure_password

  design do
    view :by_email
    view :by_confirmation_token
  end

  validates :name, :email, presence: true

  before_create :set_id

  def forgot_password!
    generate_confirmation_token
    save
  end

  def update_password(attrs)
    self.password = attrs[:password]
    self.password_confirmation = attrs[:password_confirmation]
    if valid?
      self.confirmation_token = nil
      true
    else
      false
    end
  end

  private

  def set_id
    self.id = name.parameterize
  end

  def generate_confirmation_token
    self.confirmation_token = secure_token
  end

  def secure_token
    SecureRandom.hex(20).encode('UTF-8')
  end
end
