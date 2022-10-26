99.times do |n|
name = Faker::Name.name
email = "abc#{n+1}@gmail.com"
password = "password"
User.create!(name: name,
    email: email,
    password:password,
    password_confirmation: password,
    )
end