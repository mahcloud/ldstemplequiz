Fabricator(:temple) do
  name { sequence(:name) { |i| SecureRandom.hex(12) + i.to_s } }
  address { sequence(:address) { |i| SecureRandom.hex(12) + i.to_s } }
  state_id { Fabricate(:state).id }
  latitude '1'
  longitude '1'
  link 'https://www.google.com'
end
