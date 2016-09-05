json.items @admins do |admin|
  json.id admin.id
  json.name admin.name
  json.org admin.org
  json.country admin.country
  json.email admin.email
  json.phone admin.phone
  json.created_at admin.created_at
  json.updated_at admin.updated_at
  json.edited admin.updated_at > admin.created_at + 5.minutes

  json.websites admin.websites do |website|
    json.id website.id
    json.url website.url
  end
end

json.has_more @has_more
