class SignUps::New < BrowserAction
  include Auth::RedirectSignedInUsers

  get "/sign_up" do
    admin_exist = UserQuery.new.first?
    if admin_exist
      redirect to: Home::Index
    end
    html NewPage, operation: SignUpUser.new
  end
end
