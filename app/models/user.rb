class User < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :reviews
  has_many :books, through: :reviews

 def self.top_users
    select('users.*, coalesce(count(reviews.id), 0) AS review_count')
      .joins(:reviews)
      .group(:id)
      .order("review_count DESC")
 end

 def sort_reviews_by_date(sort_dir)
   reviews.order("created_at #{sort_dir}")
 end


end
