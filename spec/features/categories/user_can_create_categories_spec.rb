require 'rails_helper'

describe 'user can create a new category' do
  describe 'they link from the index page' do
    describe 'they fill in the form' do
      it 'creates the new category' do
        visit categories_path
        click_link("Create a New Category")

        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: "New Title"
        click_on("Create Category")
        
        expect(page).to have_content("#{Category.last.title}")
        expect(current_path).to eq("/categories/#{Category.last.id}")
        expect(page).to have_content("New Title")
      end
      
      it 'should show error message if category already exists' do
        category = Category.create!(title: "Test")
        visit categories_path
        click_link("Create a New Category")

        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: "Test"
        click_on("Create Category")
        
        expect(page).to have_content("Title has already been taken!")
        expect(current_path).to eq(new_category_path)
      end
    end
  end
end
