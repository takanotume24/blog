class Posts::Show < BrowserAction
  route do
    html ShowPage, post: PostQuery.find(post_id)
  end
end
