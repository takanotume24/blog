class Posts::Create < BrowserAction
  route do
    pp params
    SavePost.create(params) do |operation, post|
      if post
        yaml = {
          "title"      => post.title,
          "created_at" => post.created_at,
          "updated_at" => post.updated_at,
        }.to_yaml

        path = Path["./", "markdowns", "#{post.id}.md"]
        Dir.mkdir_p path.parent
        
        file_content = 
          <<-STRING
          #{yaml}
          ---
          #{post.content}
          STRING

        File.write(path, file_content)
        flash.success = "The record has been saved"
        redirect Show.with(post.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
