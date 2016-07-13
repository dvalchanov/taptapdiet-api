MANDRILL_API_KEY = "OuSZWWpVxHVqLQrHHCBtJw"
ActionMailer::Base.smtp_settings = {
  password: MANDRILL_API_KEY,
  user_name: "AffectX",
  address: "smtp.mandrillapp.com",
  port: "587",
  enable_starttls_auto: true,
  authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"