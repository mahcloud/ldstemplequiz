json.title @country.name
json.type 'marker'
json.locations @country.temples do |temple|
  json.lat temple.latitude
  json.lon temple.longitude
  json.html temple.name
  json.title temple.name
end
