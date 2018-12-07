class Author < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true

  has_many :book_authors
  has_many :books, through: :book_authors


  def self.sanitize_authors_input(params)
    author_list = params[:authors].split(', ')
    sanitized_authors = author_list.map do |author|
      clean_author = author.downcase.titlecase
      Author.find_or_create_by(name: clean_author)
    end
    params[:authors] = sanitized_authors
    params
  end
end
