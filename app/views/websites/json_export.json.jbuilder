json.items @websites do |website|
  json.domain website.url
  json.name_server website.name_server

  json.admin do
    json.name website.admin.name
    json.email website.admin.email
  end

  json.tech do
    json.name website.tech.name
    json.email website.tech.email
  end

  json.registrar do
    json.name website.registrar.name
    json.email website.registrar.email
  end
end
