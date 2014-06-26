class Meeting < CouchRest::Model::Base
  paginates_per 12

  property :title,       String
  property :description, String
  property :starts_at,   DateTime
  property :venue,       String
  property :author,      Author
  property :video_url,   String
  property :comments,    Comment, array: true

  collection_of :attendees, class_name: 'User'
  timestamps!

  design do
    view :by_starts_at
  end

  before_create :set_id

  def add_comment(user, attrs)
    attrs.merge!(user_id: user.id, user_name: user.name)
    self.comments << attrs
    save
  end

  def delete_comment(comment)
    self.comments.delete(comment)
    save
  end

  def add_attendee(user)
    self.attendees << user
    save
  end

  private

  def set_id
    self.id = title.parameterize
  end
end
