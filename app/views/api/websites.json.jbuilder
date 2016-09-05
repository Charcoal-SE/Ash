json.items @websites do |website|
  json.id website.id
  json.url website.url
  json.post_count website.post_count
  json.name_server website.name_server
  json.created_at website.created_at
  json.updated_at website.updated_at
  json.edited website.updated_at > website.created_at + 5.minutes

  json.admin do
    json.id website.admin.id
    json.name website.admin.name
    json.email website.admin.email
  end

  json.tech do
    json.id website.tech.id
    json.name website.tech.name
    json.email website.tech.email
  end

  json.registrar do
    json.id website.registrar.id
    json.name website.registrar.name
    json.email website.registrar.email
  end
end

json.has_more @has_more
