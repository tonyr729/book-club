class Book < ApplicationRecord
  validates_presence_of :title, :pages, :publication_year
  validates :title, uniqueness: true

  has_many :book_authors, :dependent => :destroy
  has_many :authors, through: :book_authors

  has_many :reviews, :dependent => :destroy
  has_many :users, through: :reviews

  def self.order_by_reviews_count(sort_dir)
    select('books.*, coalesce(count(reviews.id), 0) AS review_count')
      .joins(:reviews)
      .group(:id)
      .order("review_count #{sort_dir}")
  end

  def self.order_by_ratings(sort_dir)
    select('books.*, avg(rating) AS avg_rating')
      .joins(:reviews)
      .group(:id)
      .order("avg_rating #{sort_dir}")
  end


  def self.all_rating_sort(sort_dir)
    order_by_ratings(sort_dir).limit(3)
  end

  def co_authors(main_author)
    authors.where.not(id: main_author.id)
  end

  def average_rating
    reviews.average(:rating)
  end
  
  def rating_sort(sort_dir)
    reviews.order("rating #{sort_dir}").limit(3)
  end
end
