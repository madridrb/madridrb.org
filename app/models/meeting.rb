class Meeting < CouchRest::Model::Base
  property :title,       String
  property :slug,        String
  property :description, String
  property :starts_at,   DateTime
  property :venue,       String

  timestamps!

  design do
    view :by_slug
  end

  before_create :set_slug

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
