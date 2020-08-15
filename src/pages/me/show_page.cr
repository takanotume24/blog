class Me::ShowPage < MainLayout
  def content
    user = @current_user
    if user
      h1 "This is your profile"
      h3 "Email:  #{user.email}"
      link "New Post", to: Posts::New
    end
    list_posts
  end

  def list_posts
    posts = PostQuery.new

    h3 "Posts: #{posts.size}"
    div do
      posts.each do |post|
        ul do
          li do
            link post.title, Posts::Show.with(post)
          end
          div do
            raw post.content
          end
        end
      end
    end
  end
end
