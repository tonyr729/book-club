require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I visit a book show page' do
    it 'displays a book' do
      book_1 = Book.create(title: "Fire and Ice", pages: 400, publication_year: 2016)
      author_1 = book_1.authors.create(name: "George Martin")
      author_2 = book_1.authors.create(name: "HBO")
      user_1 = User.create(name: "Hamburglar")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
      user_2 = User.create(name: "McDonald")
      review_2 = user_2.reviews.create(title: "Amazing book!", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_1)

      visit book_path(book_1)

      expect(page).to have_content(book_1.title)
      expect(page).to have_content("Pages: #{book_1.pages}")
      expect(page).to have_content("Publication: #{book_1.publication_year}")
      book_1.authors.each do |author|
        expect(page).to have_content("Author: #{author.name}")
      end
      book_1.reviews.each do |review|
        expect(page).to have_content("Review: #{review.title}")
        expect(page).to have_content(review.description)
        expect(page).to have_content(review.rating)
      end
    end
  end
end
