User.create! name: "admin", email: "admin@demo.com", role: :admin,
  password: "123qwe", password_confirmation: "123qwe"

20.times do |n|
  name = Faker::Name.name
  email = "bibi#{n+1}@demo.com"
  password = "123qwe"
  User.create! name: name, email: email, role: :user, password: password,
    password_confirmation: password
end
