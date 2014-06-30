module Helpers

  def login_as(user)
    page.set_rack_session(user_id: user.id)
  end

  def should_see(text)
    expect(page).to have_content text
  end

  def should_not_see(text)
    expect(page).to have_no_content text
  end

  def recreate!(model)
    klass = model.to_s.classify.constantize
    klass.database.delete!
    klass.database.create!
  end

  def should_be_on(path)
    current_path == path
  end

end
