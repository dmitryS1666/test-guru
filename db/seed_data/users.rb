# 10.times { User.create!(email: Faker::Internet.email, password: Faker::Internet.password) }

User.create!(email: 'admin@mail.com', password: '123123', type: 'Admin')