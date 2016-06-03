User.create!(name: "shimoji terufumi",
             email: "e125761@ie.u-ryukyu.ac.jp",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

10.times do |n|
  name = "Vegetable-#{n+1}"
  content = "Perfect #{name}"
  price = 100
  Product.create!(name: name, content: content, price: price)
end
