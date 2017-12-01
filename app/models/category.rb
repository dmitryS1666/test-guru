class Category < ApplicationRecord
  has_many :tests

  default_scope {order(title: :DESC)}

  validate :title, presence: true, uniqueness: true
end