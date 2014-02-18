class Meeting < CouchRest::Model::Base
  property :title,       String
  property :id,          String
  property :description, String
  property :starts_at,   DateTime
  property :venue,       String

  timestamps!

  design do
    view :by_id
  end

  before_save :set_id

  private

  def set_id
    self.id = title.parameterize
  end
end
