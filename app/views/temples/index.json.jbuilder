json.locations @temples do |temple|
  json.id temple.id
  json.lat temple.latitude
  json.lon temple.longitude
  json.html temple.name
  json.title temple.name
end
