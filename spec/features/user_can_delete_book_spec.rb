require 'rails_helper'

describe "user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles without the deleted entry" do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
      author_1 = book_1.authors.create(name: "George Martin")
      author_2 = book_1.authors.create(name: "HBO")
      user_1 = User.create(name: "Hamburglar")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
      user_2 = User.create(name: "McDonald")
      review_2 = user_2.reviews.create(title: "Amazing book!", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_2)

      visit book_path(book_1)
      click_link "Delete Book"

      expect(current_path).to eq(books_path)
      expect(page).to_not have_content(book_1.title)
    end
  end
end
