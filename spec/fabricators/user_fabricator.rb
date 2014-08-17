Fabricator(:user) do
  name "John Doe"
  type 'User'
  email { sequence(:email) { |i| SecureRandom.hex(12) + "#{i}@gmail.com" } }
  password 'password'
end
