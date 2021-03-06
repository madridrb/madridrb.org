class MeetingPolicy < ApplicationPolicy

  def attend?
    user.present? && record.starts_at.future? && !record.attendees.include?(user)
  end

  def unattend?
    user.present? && record.starts_at.future? && record.attendees.include?(user)
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end
