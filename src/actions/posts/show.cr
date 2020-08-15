class Posts::Show < BrowserAction
  include Auth::AllowGuests

  route do
    html ShowPage, post: PostQuery.find(post_id)
  end
end
