class Home::Index < BrowserAction
  include Auth::AllowGuests

  get "/" do
    admin_exist = UserQuery.new.first?

    if !admin_exist
      redirect SignUps::Create
    end
    
    if current_user?
      redirect Me::Show
    else
      # When you're ready change this line to:
      #
      #   redirect SignIns::New
      #
      # Or maybe show signed out users a marketing page:
      #
      #   html Marketing::IndexPage
      html Posts::IndexPage, posts: PostQuery.new
    end
  end
end
