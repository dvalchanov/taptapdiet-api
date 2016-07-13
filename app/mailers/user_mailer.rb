class UserMailer < BaseMandrillMailer
  def user_invite(user, to_email)
    subject = "Welcome to our awesome app!"
    merge_vars = {
      "FIRST_NAME" => user.user_name
    }
    body = mandrill_template("user_invite", merge_vars)

    send_mail(to_email, subject, body)
  end
end