require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I visit a book show page' do
    it 'displays a book' do
      book_1 =Book.create(title: "Fire and Ice", pages: 400, publication_year: 2016)
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019)
      author_1 = book_1.authors.create(name: "George Martin")
      author_2 = book_2.authors.create(name: "HBO")
      user_1 = User.create(name: "Hamburglar")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
      user_2 = User.create(name: "McDonald")
      review_2 = user_2.reviews.create(title: "Amazing book!", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_2)

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
        expect(page).to have_content("Rating: #{review.rating}")
        expect(page).to have_content("by: #{review.user.name}")
      end
      expect(page).to_not have_content(book_2.title)
    end

    it 'shows statistics about the book' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      user_1 = User.create(name: "Hamburglar")
      user_2 = User.create(name: "Michael")
      user_3 = User.create(name: "Ricardo")
      user_4 = User.create(name: "Lance")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 5, book: book_1)
      review_2 = user_2.reviews.create(title: "Thrilling book", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_1)
      review_3 = user_3.reviews.create(title: "Amazing book!", description: "I love this book so much. It's the best thing I've ever read!!!!!!.", rating: 4, book: book_1)
      review_4 = user_2.reviews.create(title: "It was a book?", description: "Eh, it was ok.", rating: 3, book: book_1)
      review_5 = user_3.reviews.create(title: "My Favorite Book", description: "SO GOOD, EVERYONE READ THIS BOOK!", rating: 3, book: book_1)
      review_6 = user_4.reviews.create(title: "I should probably read it again", description: "Didn't really follow what was going on.", rating: 2, book: book_1)
      review_7 = user_1.reviews.create(title: "Scary Book", description: "0 Stars, too scary.", rating: 1, book: book_1)
      review_8 = user_1.reviews.create(title: "Horrible", description: "This book was not informative. I would like a refund.", rating: 1, book: book_1)

      visit book_path(book_1)
      save_and_open_page
      within '#top-three' do
        expect(page).to have_content(review_1.title)
        expect(page).to have_content(review_2.title)
        expect(page).to have_content(review_3.title)
      end
      within '#bottom-three' do
        expect(page).to have_content(review_6.title)
        expect(page).to have_content(review_7.title)
        expect(page).to have_content(review_8.title)
      end
    end
  end
end
