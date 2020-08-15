class Posts::Show < BrowserAction
  include Auth::AllowGuests

  route do
    html ShowPage, post: Post.new(post_id,)
  end
end
