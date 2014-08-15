Fabricator(:continent) do
  name { sequence(:name) { |i| SecureRandom.hex(12) + i.to_s } }
end
