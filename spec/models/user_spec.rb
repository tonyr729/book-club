require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_uniqueness_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:reviews)}
    it {should have_many(:books).through(:reviews)}
  end

  describe 'class methods' do
    it 'finds top users by review count' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      book_2 = Book.create(title: "Dragons on ice", pages: 600, publication_year: 2018)
      book_3 = Book.create(title: "Dragons and Zombies, a love story.", pages: 600, publication_year: 2018)
      user_1 = User.create(name: "Hamburglar")
      user_2 = User.create(name: "Michael")
      user_3 = User.create(name: "Ricardo")
      user_4 = User.create(name: "Lance")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 5, book: book_1)
      review_2 = user_1.reviews.create(title: "Scary Book", description: "0 Stars, too scary.", rating: 1, book: book_2)
      review_3 = user_1.reviews.create(title: "Horrible", description: "This book was not informative. I would like a refund.", rating: 1, book: book_3)
      review_4 = user_2.reviews.create(title: "Thrilling book", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_1)
      review_5 = user_2.reviews.create(title: "It was a book?", description: "Eh, it was ok.", rating: 3, book: book_2)
      review_6 = user_3.reviews.create(title: "Amazing book!", description: "I love this book so much. It's the best thing I've ever read!!!!!!.", rating: 4, book: book_1)

      expected = [user_1, user_2, user_3]
      
      expect(User.top_users).to eq(expected)

    end
  end

end
