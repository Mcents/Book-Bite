class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, :author, :isbn, :jacket, presence: true
end
