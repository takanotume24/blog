class Posts::Create < BrowserAction
  route do
    pp params
    SavePost.create(params) do |operation, post|
      if post
        path = Path["./","markdowns","#{post.title}.md"]
        Dir.mkdir_p path.parent
        File.write(path, post.content)
        flash.success = "The record has been saved"
        redirect Show.with(post.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
