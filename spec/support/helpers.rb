module Helpers

  def should_see(text)
    expect(page).to have_content text
  end

  def recreate!(model)
    klass = model.to_s.classify.constantize
    klass.database.delete!
    klass.database.create!
  end

end
