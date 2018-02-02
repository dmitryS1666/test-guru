# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# category_list = [
#     ['Testing'], ['Development'],
#     ['Design'], ['DevOps']
# ]
#
# test_list = [
#     ['HTML', 1, 2], ['JAVA', 2, 2],
#     ['RUBY', 2, 2], ['PhotoShop', 1, 4]
# ]
#
# question_list = [
#     ['Назовите тег параграфа ?', 1],
#     ['Назовите арифметические операторы ?', 2],
#     ['Что такое блоки ?', 3],
#     ['Назовите типы переменных ?', 3],
#     ['Как изменить размер холста ?', 5]
# ]
#
#
#
# category_list.each do |category|
#   Category.create( :title => category[0])
# end
#
# test_list.each do |test|
#   Test.create(:title => test[0], :level => test[1], :category_id => test[2])
# end
#
# question_list.each do |question|
#   Question.create(:body => question[0], :test_id => question[1])
# end


# load 'db/seed_data/users.rb'
# load 'db/seed_data/categories.rb'
# load 'db/seed_data/tests.rb'
# load 'db/seed_data/questions.rb'
load 'db/seed_data/answers.rb'