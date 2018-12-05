require './app/models/book.rb'
require 'yaml'


books = YAML.load_file('lib/assets/books.yaml')

Book.destroy_all

books.each do |book|
  new_book = Book.create!({
    title: book[:title],
    pages: book[:pages],
    publication_year: book[:publication_year]
  })

  # new_book.author.find_or_create_by(book[:author])
end

p "Created #{Book.count} books"
p "Created #{Author.count} authors"
