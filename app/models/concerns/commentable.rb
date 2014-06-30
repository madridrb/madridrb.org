module Commentable
  extend ActiveSupport::Concern

  included do
    property :comments, Comment, array: true
  end

  def add_comment(user, attrs)
    attrs.merge!(
      user_id: user.id,
      user_name: user.name,
      created_at: Time.current)
    self.comments << attrs
    save
  end

  def delete_comment(comment)
    self.comments.delete(comment)
    save
  end

end
