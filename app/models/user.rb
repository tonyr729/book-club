class User < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :reviews
  has_many :books, through: :reviews
end
