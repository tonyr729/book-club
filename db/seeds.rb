require './app/models/book.rb'
require 'yaml'
require 'faker'


books = YAML.load_file('lib/assets/books.yaml')

Book.destroy_all
Author.destroy_all

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
    new_book.authors << Author.find_or_create_by({ name: book[:author] })
  end
end

p "Created #{Book.count} books"
p "Created #{Author.count} authors"


User.destroy_all
Review.destroy_all
x = 0
while x <= 200
  
  user = User.create(name: Faker::Name.name)
  review_1 = user.reviews.create(title: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph, rating: (1 + rand(5)), book: Book.find((1 + rand(93))))
  review_2 = user.reviews.create(title: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph, rating: (1 + rand(5)), book: Book.find((1 + rand(93))))
  review_3 = user.reviews.create(title: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph, rating: (1 + rand(5)), book: Book.find((1 + rand(93))))


  x = x + 1
end

p "Created #{User.count} users"
p "Created #{Review.count} reviews"