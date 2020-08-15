class Posts::Edit < BrowserAction
  route do
    post = PostQuery.find(post_id)
    html EditPage,
      operation: SavePost.new(post),
      post: post
  end
end
