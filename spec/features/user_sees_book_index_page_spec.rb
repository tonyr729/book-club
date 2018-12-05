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
  end
end