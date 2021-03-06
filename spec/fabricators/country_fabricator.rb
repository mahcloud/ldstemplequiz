Fabricator(:country) do
  name { sequence(:name) { |i| SecureRandom.hex(12) + i.to_s } }
  continent_id { Fabricate(:continent).id }
end
