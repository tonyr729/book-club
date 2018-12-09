require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I visit a book index page' do
    it 'displays all book titles' do
      book_1 = Book.create(title: "Fire and Ice", pages: 400, publication_year: 2016)
      book_2 = Book.create(title: "Ooo Dragons", pages: 500, publication_year: 2017)
      book_3 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)

      visit books_path

      expect(page).to have_content("All Books")
      expect(page).to have_content(book_1.title)
      expect(page).to have_content("Pages: #{book_1.pages}")
      expect(page).to have_content("Publication: #{book_1.publication_year}")
      expect(page).to have_content(book_2.title)
      expect(page).to have_content("Pages: #{book_2.pages}")
      expect(page).to have_content("Publication: #{book_2.publication_year}")
      expect(page).to have_content(book_3.title)
      expect(page).to have_content("Pages: #{book_3.pages}")
      expect(page).to have_content("Publication: #{book_3.publication_year}")
    end

    it 'shows book titles as links to the book show page' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)

      visit books_path
      
      click_link book_1.title

      expect(current_path).to eq(book_path(book_1))
      expect(page).to have_content(book_1.title)
    end

    it 'shows authors as links to the authors show page' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
      author_1 = Author.create(name: "George Martin", books: [book_1])
      author_2 = Author.create(name: "George Lucus", books: [book_1, book_2])

      visit books_path
      
      click_link author_1.name

      expect(current_path).to eq(author_path(author_1))
      expect(page).to have_content(author_1.name)
    end
  end
end
