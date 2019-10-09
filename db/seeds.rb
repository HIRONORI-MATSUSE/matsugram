50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  image = ""
  User.create!(name: name,
               email: email,
               password: password,
               user_image: image,
               )
end
