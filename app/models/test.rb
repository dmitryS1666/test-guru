class Test < ApplicationRecord

  def self.tests_by_category(category)
    Test.select('title').joins('INNER JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order('tests.created_at DESC')
  end

end
