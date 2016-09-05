json.items @registrars do |registrar|
  json.id registrar.id
  json.name registrar.name
  json.url registrar.url
  json.email registrar.email
  json.phone registrar.phone
  json.created_at registrar.created_at
  json.updated_at registrar.updated_at
  json.edited registrar.updated_at > registrar.created_at + 5.minutes

  json.websites registrar.websites do |website|
    json.id website.id
    json.url website.url
  end
end

json.has_more @has_more
