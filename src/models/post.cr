class Post < BaseModel
  table do
    column title : String
    column content : String
  end
end
