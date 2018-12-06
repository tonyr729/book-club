class Author < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :book_authors
  has_many :books, through: :book_authors
end
