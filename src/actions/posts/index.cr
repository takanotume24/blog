class Posts::Index < BrowserAction
  route do
    html IndexPage, posts: PostQuery.new
  end
end
