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
  if book[:author].class == Array
    book[:author].each do |a|
      new_book.authors.find_or_create_by({ name: a[:author] })
    end
  else
    new_book.authors.find_or_create_by({ name: book[:author] })
  end
end

p "Created #{Book.count} books"
p "Created #{Author.count} authors"
