Fabricator(:admin) do
  name "John Admin"
  type 'Admin'
  email { sequence(:email) { |i| SecureRandom.hex(12) + "#{i}@gmail.com" } }
  password 'password'
end
