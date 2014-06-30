module UsersHelper

  def link_to_twitter(twitter)
    link_to "@#{twitter}", "https://twitter.com/#{twitter}", target: '_blank'
  end

end
