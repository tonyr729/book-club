require 'rails_helper'

describe 'As a visitor' do
  describe 'click link from book index' do
    it 'fills out form' do
      visit books_path
      click_link "Create a New Book"

      expect(current_path).to eq(new_book_path)

      book_title = "zoMbies and Dragons"
      book_pages = 345
      book_publication_year = 1079
      book_authors = "ROnAlD mcDOnaLd, COLOnel sANDers"

      fill_in :book_title, with: book_title
      fill_in :book_pages, with: book_pages
      fill_in :book_publication_year, with: book_publication_year
      fill_in :book_authors, with: book_authors

      click_button 'Create Book'

      expect(current_path).to eq(book_path(Book.last.id))
      expect(page).to have_content(book_title)
    end


    it 'redirects to new book form if duplicate title' do
      book_1 = Book.create(title: "Fire and Ice", pages: 400, publication_year: 2016)
      author_1 = book_1.authors.create(name: "George Martin")

      book_title = "Fire and Ice"
      book_pages = 545
      book_publication_year = 1979
      book_authors = "HBO"

      visit new_book_path

      fill_in :book_title, with: book_title
      fill_in :book_pages, with: book_pages
      fill_in :book_publication_year, with: book_publication_year
      fill_in :book_authors, with: book_authors

      click_button 'Create Book'

      error = "Title has already been taken"

      expect(page).to have_content(error)
    end
  end
end
