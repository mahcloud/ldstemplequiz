Fabricator(:state) do
  name { sequence(:name) { |i| SecureRandom.hex(12) + i.to_s } }
  country_id { Fabricate(:country).id }
end
