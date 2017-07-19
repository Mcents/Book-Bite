class Category < ApplicationRecord
  has_many :books
  validates :title, presence: true, uniqueness: true
end
