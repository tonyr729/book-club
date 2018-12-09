require 'rails_helper'

describe "user deletes an author" do
  describe "they link to delete author" do
    it "displays all books without the deleted author" do
      author_1 = Author.create(name: "George Martin")
      author_2 = Author.create(name: "HBO")
      book_1 = Book.create(title: "Oh no, ice zombies", pages: 600, publication_year: 2018, authors: [author_1, author_2])
      book_2 = Book.create(title: "Dragon Zombies", pages: 500, publication_year: 2019, authors: [author_2])
      book_3 = Book.create(title: "Ice Skating with Dragon Zombies", pages: 200, publication_year: 2012, authors: [author_1])

      visit author_path(author_1)

      click_link "Delete Author"

      expect(current_path).to eq(books_path)
      expect(page).to_not have_content(author_1.name)
      expect(page).to have_content(author_2.name)
      expect(page).to_not have_content(book_1.title)
      expect(page).to have_content(book_2.title)
      expect(page).to_not have_content(book_3.title)
    end
  end
end
