require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I visit the root page' do
    it 'displays a welcome screen' do

      visit root_path

      expect(page).to have_content("Welcome!")
    end
  end
end
