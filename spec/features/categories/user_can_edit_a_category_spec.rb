require 'rails_helper'

describe 'user can edit a category' do
  describe 'they link from the index page' do
    describe 'they fill out the form' do
      it 'updates the category with new information' do
        category = Category.create!(title: "Software")
        category_titel = "HR"
        
        visit categories_path
        click_link "Edit"

        expect(current_path).to eq(edit_category_path(category))

        fill_in 'category[title]', with: category_titel
        click_on "Update Category"
        
        expect(current_path).to eq(category_path(category))
        expect(page).to have_content(category_titel)
        expect(page).to_not have_content("Software")
      end

      it 'should show an error message if title already exists' do
        category_1 = Category.create!(title: "Software")
        category_2 = Category.create!(title: "Management")
        category_titel = "Management"
        
        visit categories_path
        within("#category-#{category_1.id}") do
        click_link "Edit"
        end

        expect(current_path).to eq(edit_category_path(category_1))

        fill_in 'category[title]', with: category_titel
        click_on "Update"
        
        expect(current_path).to eq(edit_category_path(category_1))
        expect(page).to have_content("Title already exists!")
      end
    end
  end
end
