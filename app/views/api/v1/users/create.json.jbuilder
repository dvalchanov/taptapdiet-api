json.current_user do
  json.id @user.id
  json.token @user.access_tokens.by_date.first.token
end