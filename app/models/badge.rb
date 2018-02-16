class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :url_file, presence: true
  validates :rule_value, presence: true
  validates :rule_name, presence: true
end