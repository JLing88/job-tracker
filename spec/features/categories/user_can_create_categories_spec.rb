require 'rails_helper'

describe 'user can create a new category' do
  describe 'they link from the index page' do
    describe 'they fill in the form' do
      it 'creates the new category' do
        category_titel = "HR"
        visit categories_path
        click_link("Create a New Category")

        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: category_titel
        click_on("Create Category")
        
        expect(current_path).to eq(category_path(Category.last))
        expect(page).to have_content(Category.last.title)
        expect(page).to have_content(category_titel)
      end
      
      it 'should show error message if category already exists' do
        category = Category.create!(title: "Test")
        category_titel = "Test"
        visit categories_path
        click_link("Create a New Category")

        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: category_titel
        click_on("Create Category")
        
        expect(current_path).to eq(new_category_path)
        expect(page).to have_content("Title has already been taken!")
      end
    end
  end
end
