require "markd"

class Posts::ShowPage < MainLayout
  needs post : Post
  quick_def page_title, "Post with id: #{@post.id}"

  def content
    user = @current_user

    link "Back to all Posts", Posts::Index
    h1 @post.title

    if user
      render_actions
    end

    render_post_fields
  end

  def render_actions
    section do
      link "Edit", Posts::Edit.with(@post.id)
      text " | "
      link "Delete",
        Posts::Delete.with(@post.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_post_fields
    table do
      tr do
        td do
          text "created_at:"
        end
        td do
          text post.created_at.to_s
        end
      end
      tr do
        td do
          text "updated_at:"
        end
        td do
          text post.updated_at.to_s
        end
      end
    end
    raw Markd.to_html @post.content.to_s
  end
end
