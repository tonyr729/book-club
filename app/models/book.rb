class Book < ApplicationRecord
  validates_presence_of :title, :pages, :publication_year
  validates :title, uniqueness: true

  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :reviews
  has_many :users, through: :reviews
end
