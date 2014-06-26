class CommentPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def destroy?
    user.present? && user.id == record.user_id
  end

  def permitted_params
    %i{body}
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end
