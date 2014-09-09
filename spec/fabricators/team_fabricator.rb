Fabricator(:team) do
  name { sequence(:name) { |i| SecureRandom.hex(12) + i.to_s } }
  leader_id { Fabricate(:user).id }
end
