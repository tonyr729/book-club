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
  end
end
