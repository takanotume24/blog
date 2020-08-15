class Posts::IndexPage < MainLayout
  needs posts : PostQuery
  quick_def page_title, "All Posts"

  def content
    user = @current_user

    h1 "All Posts"
    
    if user
      link "New Post", to: Posts::New
    end
    
    render_posts
  end

  def render_posts
    ul do
      @posts.each do |post|
        li do
          link post.title, Posts::Show.with(post)
          raw Markd.to_html(post.content)
        end
      end
    end
  end
end
