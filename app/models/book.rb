class Book < ApplicationRecord
  validates_presence_of :title, :pages, :publication_year
end