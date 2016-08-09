json.current_user do
  json.id @user.id
  json.time_zone @user.time_zone
  json.user_name @user.user_name
  json.fb_token @user.fb_token
  json.token @user.access_tokens.by_date.first.token
end
