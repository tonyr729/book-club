require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I click a user name from any review' do
    it 'displays user show page' do
      book_1 = Book.create(title: "Fire and Ice", pages: 400, publication_year: 2016)
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
      author_1 = book_1.authors.create(name: "George Martin")
      author_2 = book_2.authors.create(name: "HBO")
      user_1 = User.create(name: "Hamburglar")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
      review_2 = user_1.reviews.create(title: "Amazing book!", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_2)

      visit book_path(book_1)

      click_link user_1.name

      expect(current_path).to eq(user_path(user_1))

      expect(page).to have_content(user_1.name)
      expect(page).to have_content("Title: #{review_1.title}")
      expect(page).to have_content("Description: #{review_1.description}")
      expect(page).to have_content("Rating: #{review_1.rating}")
      expect(page).to have_content("Title: #{review_2.title}")
      expect(page).to have_content("Description: #{review_2.description}")
      expect(page).to have_content("Rating: #{review_2.rating}")
    end
  end
end