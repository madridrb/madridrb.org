class Meeting < CouchRest::Model::Base
  include Commentable
  include Attendable

  paginates_per 12

  property :title,       String
  property :description, String
  property :starts_at,   DateTime
  property :venue,       String
  property :author,      Author
  property :video_url,   String

  timestamps!

  design do
    view :by_starts_at
  end

  before_create :set_id

  private

  def set_id
    self.id = title.parameterize
  end
end
