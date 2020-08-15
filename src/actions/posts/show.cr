class Posts::Show < BrowserAction
  include Auth::AllowGuests

  route do
    file = File.read Path["./", "markdowns", "#{post_id}.md"]
    yaml_header = FrontMatterMarkd.yaml file
    content = FrontMatterMarkd.to_html file

    # 2020-08-15 15:39:45.000000000

    if yaml_header
      post = Post.new(
        id: post_id.to_i64,
        created_at: Time.parse_utc(yaml_header["created_at"].to_s, "%F %T"),
        updated_at: Time.parse_utc(yaml_header["updated_at"].to_s, "%F %T"),
        title: yaml_header["title"].to_s,
        content: content
      )
      html ShowPage, post: post
    else
      redirect Home::Index
    end

  end
end
