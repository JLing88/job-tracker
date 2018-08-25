require 'rails_helper'

describe 'user can see all categories' do
  describe 'they link from the nav bar' do
    it 'shows all categories' do
      category_1 = Category.create!(title: "Software")
      category_2 = Category.create!(title: "Management")
      category_3 = Category.create!(title: "Human Resources")

      visit categories_path

      expect(current_path).to eq('/categories')

      expect(page).to have_content(category_1.title)
      expect(page).to have_content(category_2.title)
      expect(page).to have_content(category_3.title)
    end
  end
end
