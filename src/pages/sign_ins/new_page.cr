class SignIns::NewPage < AuthLayout
  needs operation : SignInUser

  def content
    h1 "Sign In"
    render_sign_in_form(@operation)
  end

  private def render_sign_in_form(op)
    admin_exist = UserQuery.new.first?

    form_for SignIns::Create do
      sign_in_fields(op)
      submit "Sign In", flow_id: "sign-in-button"
    end

    link "Reset password", to: PasswordResetRequests::New
    if !admin_exist
      text " | "
      link "Sign up", to: SignUps::New
    end
  end

  private def sign_in_fields(op)
    mount Shared::Field.new(op.email, "Email"), &.email_input(autofocus: "true")
    mount Shared::Field.new(op.password, "Password"), &.password_input
  end
end
