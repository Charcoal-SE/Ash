json.items @techs do |tech|
  json.id tech.id
  json.name tech.name
  json.org tech.org
  json.country tech.country
  json.email tech.email
  json.phone tech.phone
  json.created_at tech.created_at
  json.updated_at tech.updated_at
  json.edited tech.updated_at > tech.created_at + 5.minutes

  json.websites tech.websites do |website|
    json.id website.id
    json.url website.url
  end
end

json.has_more @has_more
