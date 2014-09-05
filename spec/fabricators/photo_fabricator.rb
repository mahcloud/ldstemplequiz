Fabricator(:photo) do
  link { sequence(:link) { |i| SecureRandom.hex(12) + i.to_s } }
  temple_id { Fabricate(:temple).id }
end
