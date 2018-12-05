require './app/models/book.rb'
require 'yaml'


books = YAML.load_file('lib/assets/books.yaml')

Book.destroy_all

books.each do |book|
  Book.create!({
    title: book[:title],
    pages: book[:pages],
    publication_year: book[:publication_year]
  })
end

p "Created #{Book.count} books"