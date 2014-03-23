class CommentPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def permitted_params
    %i{user_name body}
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end
