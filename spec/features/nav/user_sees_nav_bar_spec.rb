require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the root page' do
    it 'displays a navbar with a link to books and home' do
      visit root_path

      click_link "Home"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome!")
      
      click_link "Books"

      expect(current_path).to eq(books_path)
      expect(page).to have_content("All Books")
    end
  end
end

