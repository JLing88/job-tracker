require 'rails_helper'

describe 'user can see one category' do
  describe 'they link from index page' do 
    it 'should show one category' do
      category_1 = Category.create!(title: "Software")
      category_2 = Category.create!(title: "Development")
      
      
      visit categories_path
      click_link(category_1.title)
      
      expect(current_path).to eq(category_path(category_1))
      expect(page).to have_content("#{category_1.title}")
      expect(page).to_not have_content("#{category_2.title}")
      
    end 
  end
end 
    
    
