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
end
