require 'rails_helper'

describe 'Adding a new book' do
  it 'shows a form' do
    book_title = "zoMbies and Dragons"
    book_pages = 345
    book_publication_year = 1079
    book_authors = "ROnAlD mcDOnaLd, COLOnel sANDers"


    visit new_book_path

    fill_in :book_title, with: book_title
    fill_in :book_pages, with: book_pages
    fill_in :book_publication_year, with: book_publication_year
    fill_in :book_authors, with: book_authors

    click_button 'Create Book'

    expect(current_path).to eq("/books/#{Book.last.id}")
    expect(page).to have_content(book_title)
  end
end
