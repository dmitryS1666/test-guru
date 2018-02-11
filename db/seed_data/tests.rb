tests = [
    ['Git basics', 1, 1, 1],
    ['Git branching', 2, 1, 1],
    ['Ruby beginner', 0, 2, 1],
    ['Ruby OOP', 3, 2, 1],
    ['SQL in Rails', 4, 2, 1],
    ['Algo basics', 5, 3, 1],
    ['Searching', 6, 3, 1]
]

tests.each do |title, level, category, user|
  Test.create!(title: title, level: level, category_id: category, user_id: user)
end