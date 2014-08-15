json.title @continent.name
json.type 'marker'
json.locations @continent.temples do |temple|
  json.lat temple.latitude
  json.lon temple.longitude
  json.html temple.name
  json.title temple.name
end
