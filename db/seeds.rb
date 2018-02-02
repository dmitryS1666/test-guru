# category_list = [
#     ['Git'], ['Backend'], [' Algorithms']
# ]
# category_list.each do |category|
#   Category.create( :title => category[0])
# end

test_list = [
    ['Git basics', 1, 1, 1],
    ['Git branching', 2, 1, 2],
    ['Ruby beginner', 0, 2, 3],
    ['Ruby OOP', 3, 2, 4],
    ['SQL in Rails', 4, 2, 5],
    ['Algo basics', 5, 3, 6],
    ['Searching', 6, 3, 7]
]
test_list.each do |test|
  Test.create(:title => test[0], :level => test[1], :category_id => test[2])
end

# question_list = [
#     ['Назовите тег параграфа ?', 1],
#     ['Назовите арифметические операторы ?', 2],
#     ['Что такое блоки ?', 3],
#     ['Назовите типы переменных ?', 3],
#     ['Как изменить размер холста ?', 5]
# ]

#
# question_list.each do |question|
#   Question.create(:body => question[0], :test_id => question[1])
# end


# load 'db/seed_data/users.rb'
# load 'db/seed_data/categories.rb'
# load 'db/seed_data/tests.rb'
# load 'db/seed_data/questions.rb'
# load 'db/seed_data/answers.rb'