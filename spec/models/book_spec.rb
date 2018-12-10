require 'rails_helper'

describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:publication_year)}
    it {should validate_uniqueness_of(:title)}
  end

  describe "relationships" do
    describe 'to author' do
      it {should have_many(:book_authors)}
      it {should have_many(:authors).through(:book_authors)}
    end

    describe "to user reviews" do
      it {should have_many(:reviews)}
      it {should have_many(:users).through(:reviews)}
    end
  end

  describe 'instance methods' do
    it 'finds co-authors based on given author' do
      author_1 = Author.create(name: "George Martin")
      author_2 = Author.create(name: "George Lucus")
      book = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018, authors: [author_1, author_2])

      co_author = book.co_authors(author_1)

      expect([author_2]).to eq(co_author)
    end

    it 'sorts by review rating for one book' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      user_1 = User.create(name: "Hamburglar")
      user_2 = User.create(name: "Michael")
      user_3 = User.create(name: "Ricardo")
      user_4 = User.create(name: "Lance")
      review_1 = Review.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1, user: user_1)
      review_2 = Review.create(title: "Thrilling book", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_1, user: user_2)
      review_3 = Review.create(title: "Amazing book!", description: "I love this book so much. It's the best thing I've ever read!!!!!!.", rating: 2, book: book_1, user: user_3)
      review_4 = Review.create(title: "It was a book?", description: "Eh, it was ok.", rating: 3, book: book_1, user: user_4)

      expected = [review_2, review_4, review_3]
      expect(book_1.rating_sort("desc")).to eq (expected)
    end

    it 'sorts by review rating for all books' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      book_2 = Book.create(title: "Dragons on ice", pages: 600, publication_year: 2018)
      book_3 = Book.create(title: "Dragons and Zombies, a love story.", pages: 600, publication_year: 2018)
      book_4 = Book.create(title: "Zombies riding dragons", pages: 600, publication_year: 2018)
      user_1 = User.create(name: "Hamburglar")
      user_2 = User.create(name: "Michael")
      user_3 = User.create(name: "Ricardo")
      user_4 = User.create(name: "Lance")
      review_1 = Review.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1, user: user_1)
      review_2 = Review.create(title: "Thrilling book", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_2, user: user_2)
      review_3 = Review.create(title: "Amazing book!", description: "I love this book so much. It's the best thing I've ever read!!!!!!.", rating: 2, book: book_3, user: user_3)
      review_4 = Review.create(title: "It was a book?", description: "Eh, it was ok.", rating: 3, book: book_4, user: user_4)

      expected = [book_2, book_4, book_3]
      expect(Book.all_rating_sort("desc")).to eq (expected)
    end



  end

  describe 'class methods' do
    it 'calculates average rating' do
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018)
      user_1 = User.create(name: "Hamburglar")
      user_2 = User.create(name: "Michael")
      user_3 = User.create(name: "Ricardo")
      user_4 = User.create(name: "Lance")
      review_1 = user_1.reviews.create(title: "Terrible book!", description: "Bitters retro mustache aesthetic biodiesel 8-bit.", rating: 1, book: book_1)
      review_2 = user_2.reviews.create(title: "Thrilling book", description: "Park iphone leggings put a bird on it.", rating: 5, book: book_1)
      review_3 = user_3.reviews.create(title: "Amazing book!", description: "I love this book so much. It's the best thing I've ever read!!!!!!.", rating: 2, book: book_1)
      review_4 = user_4.reviews.create(title: "It was a book?", description: "Eh, it was ok.", rating: 3, book: book_1)

      expect(book_1.average_rating).to eq(2.75)
    end

  end

end
