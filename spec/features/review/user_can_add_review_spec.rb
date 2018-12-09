require 'rails_helper'

describe 'As a visitor' do
  describe 'click link from book show page' do
    it 'fills out form' do
      book = Book.create(title: "Ooo Dragons", pages: 500, publication_year: 2017)
      visit book_path(book)
      click_link "Create a New Review"

      expect(current_path).to eq(new_book_review_path(book))

      review_title = "Book is fire"
      review_description = "Dragons are lit"
      review_user = "Puff"
      review_rating = 'Great'

      fill_in :review_title, with: review_title
      fill_in :review_description, with: review_description
      select review_rating
      fill_in :review_user, with: review_user

      click_button "Create Review"

      expect(current_path).to eq(book_path(book))

      expect(page).to have_content(review_title)
    end

    it 'adds review to existing reviews if user already exists' do
      book = Book.create(title: "Ooo Dragons", pages: 500, publication_year: 2017)

      visit new_book_review_path(book)

      review_1_title = "Book is fire"
      review_1_description = "Dragons are lit"
      review_user = "Puff"
      review_1_rating = 'Horrible'

      fill_in :review_title, with: review_1_title
      fill_in :review_description, with: review_1_description
      select review_1_rating
      fill_in :review_user, with: review_user

      click_button "Create Review"

      expect(current_path).to eq(book_path(book))

      visit new_book_review_path(book)

      review_2_title = "Book is really good"
      review_2_description = "Dragons are fire"
      review_2_rating = 'Great'

      fill_in :review_title, with: review_2_title
      fill_in :review_description, with: review_2_description
      select review_2_rating
      fill_in :review_user, with: review_user

      click_button "Create Review"

      user_1 = User.find_by(name: review_user)

      visit user_path(user_1)

      expect(page).to have_content(review_user)
      expect(page).to have_content(review_1_title)
      expect(page).to have_content(review_2_title)
    end
  end
end
