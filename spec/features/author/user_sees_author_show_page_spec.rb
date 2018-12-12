require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit author show page' do
    it 'shows all books by that author' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
      book_3 = Book.create(title: "Bless You", pages: 500, publication_year: 2019)
      author_1 = Author.create(name: "George Martin", books: [book_1, book_2])
      author_2 = Author.create(name: "George Lucus", books: [book_1, book_2])
      author_3 = book_3.authors.create(name: "Ali")


      visit author_path(author_1)
      
      expect(page).to have_content(author_1.name)
      author_1.books.each do |book|
        expect(page).to have_content(book.title)
        expect(page).to have_content("Pages: #{book.pages}")
        expect(page).to have_content("Publication: #{book.publication_year}")
        book.co_authors(author_1).each do |author|
          expect(page).to have_content("Co-Authors: #{author.name}")
        end
      end
      expect(page).to_not have_content("Bless You")
    end

    it 'shows top review next to each book' do
      
      book_1 = Book.create(title: "Fire and Ice", pages: 400, publication_year: 2016)
      author_1 = Author.create(name: "George RR. Martin", books: [book_1])
      user_1 = User.create(name: "Hamburglar")
      user_2 = User.create(name: "Michael")
      user_3 = User.create(name: "Mackenzie")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
      review_2 = user_2.reviews.create(title: "Amazing book!", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_1)
      review_3 = user_3.reviews.create(title: "It was a book!", description: "I want my money back", rating: 2, book: book_1)

      visit author_path(author_1)

      within "#book-0" do
        expect(page).to have_content(review_2.title)
        expect(page).to have_content(review_2.rating)
        expect(page).to have_content(review_2.user.name)
        expect(page).to_not have_content(review_1.title)
        expect(page).to_not have_content(review_3.title)
      end
    end
  end
end
