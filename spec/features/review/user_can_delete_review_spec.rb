require 'rails_helper'

describe "As a visitor" do
  describe 'when I visit the users show page' do
    describe " and I click a link next to review" do
      it "deletes the review" do
        book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
        book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
        user_1 = User.create(name: "Hamburglar")
        review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
        review_2 = user_1.reviews.create(title: "Amazing book!", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_2)
  
        visit user_path(user_1)
  
  
        within("#review_#{review_1.id}") do
          click_link "Delete Review"
        end
  
        expect(current_path).to eq(user_path(user_1))
        expect(page).to_not have_css("#review_#{review_1.id}")
        expect(page).to_not have_content(review_1.title)
        expect(page).to have_content(review_2.title)
      end
    end
  end
end
