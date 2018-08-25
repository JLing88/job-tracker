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
        expect(page).to have_content("New Title added!")
        expect(current_path).to eq(categories_path)
        expect(page).to have_content("New Title")
      end
    end
  end
end
