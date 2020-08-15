class Posts::New < BrowserAction
  route do
    html NewPage, operation: SavePost.new
  end
end
