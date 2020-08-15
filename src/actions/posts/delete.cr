class Posts::Delete < BrowserAction
  route do
    PostQuery.find(post_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
