class Meeting < CouchRest::Model::Base
  property :title,       String
  property :description, String
  property :starts_at,   DateTime
  property :venue,       String
  property :author,      Author
  property :video_url,   String
  property :comments,    Comment, array: true
  timestamps!

  design do
    view :by_starts_at
  end

  before_create :set_id

  def add_comment(attrs)
    comments << attrs
    save
  end

  private

  def set_id
    self.id = title.parameterize
  end
end
