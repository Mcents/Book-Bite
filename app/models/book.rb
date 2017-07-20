class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, :author, :isbn, presence: true
  self.per_page = 15
end
