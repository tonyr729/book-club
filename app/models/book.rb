class Book < ApplicationRecord
  validates_presence_of :title, :pages, :publication_year
  validates :title, uniqueness: true

  has_many :book_authors, :dependent => :destroy
  has_many :authors, through: :book_authors

  has_many :reviews, :dependent => :destroy
  has_many :users, through: :reviews

  def co_authors(main_author)
    authors.where.not(id: main_author.id)
  end

  def average_rating
    reviews.average(:rating)
  end
end
