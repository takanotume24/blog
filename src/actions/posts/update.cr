class Posts::Update < BrowserAction
  route do
    post = PostQuery.find(post_id)
    SavePost.update(post, params) do |operation, post|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(post.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, post: post
      end
    end
  end
end
