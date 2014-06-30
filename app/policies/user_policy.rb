class UserPolicy < ApplicationPolicy

  def edit?
    user == record
  end

  def update?
    edit?
  end

end
