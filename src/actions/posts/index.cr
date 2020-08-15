class Posts::Index < BrowserAction
  include Auth::AllowGuests
  
  route do
    html IndexPage, posts: PostQuery.new
  end
end
