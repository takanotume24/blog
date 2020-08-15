class Posts::IndexPage < MainLayout
  needs posts : PostQuery
  quick_def page_title, "All Posts"

  def content
    h1 "All Posts"
    link "New Post", to: Posts::New
    render_posts
  end

  def render_posts
    ul do
      @posts.each do |post|
        li do
          link post.title, Posts::Show.with(post)
        end
      end
    end
  end
end
