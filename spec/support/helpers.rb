module Helpers

  def should_see(text)
    expect(page).to have_content text
  end

end
