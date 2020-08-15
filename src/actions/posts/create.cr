class Posts::Create < BrowserAction
  route do
    SavePost.create(params) do |operation, post|
      if post
        flash.success = "The record has been saved"
        redirect Show.with(post.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
