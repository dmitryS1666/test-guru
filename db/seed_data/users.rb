10.times { User.create!(email: Faker::Internet.email, password: Faker::Internet.password) }
user_admin = [
    %w(admin@admin.com 123123 Admin)
]

user_admin.each do |email, password, type|
  User.create!(email: email, password: password, type: type)
end