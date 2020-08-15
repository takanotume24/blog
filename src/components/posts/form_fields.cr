class Posts::FormFields < BaseComponent
  needs operation : SavePost

  def render
    mount Shared::Field.new(operation.title), &.text_input(autofocus: "true")
    mount Shared::Field.new(operation.content), &.textarea
  end
end
