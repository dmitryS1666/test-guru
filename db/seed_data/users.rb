10.times { User.create!(email: Faker::Internet.email, password: Faker::Internet.password) }
user_admin = [
    ['admin@admin.com', 123123]
]

user_admin.each do |email, password|
  User.create!(email: email, password: password)
end