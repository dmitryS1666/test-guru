# 10.times { User.create!(email: Faker::Internet.email, password: Faker::Internet.password) }

User.create!(email: 'admin@user.com', password: '123123', type: 'Admin', first_name: 'Admin', last_name: 'Admin')
User.create!(email: 'user@user.com', password: '123123', type: 'User', first_name: 'User', last_name: 'User')