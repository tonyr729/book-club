require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit author show page' do
    it 'shows all books by that author' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
      author_1 = Author.create(name: "George Martin", books: [book_1, book_2])
      author_2 = Author.create(name: "George Lucus", books: [book_1, book_2])
      book_3 = Book.create(title: "Bless You", pages: 500, publication_year: 2019)
      author_3 = book_3.authors.create(name: "Ali")


      visit author_path(author_1)
      
      expect(page).to have_content(author_1.name)
      author_1.books.each do |book|
        expect(page).to have_content("Title: #{book.title}")
        expect(page).to have_content("Pages: #{book.pages}")
        expect(page).to have_content("Publication: #{book.publication_year}")
        book.co_authors(author_1).each do |author|
          expect(page).to have_content("Co-Authors: #{author.name}")
        end
      end
      expect(page).to_not have_content("Bless You")
    end
  end
end
