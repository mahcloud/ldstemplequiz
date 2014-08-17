Fabricator(:answer) do
  user_id { Fabricate(:user).id }
  temple_id { Fabricate(:temple).id }
  guess_id 1
  correct true
end
