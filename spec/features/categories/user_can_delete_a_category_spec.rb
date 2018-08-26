require 'rails_helper'

describe 'user can delete a category' do 
  it 'should delete a category' do 
    category_1 = Category.create!(title: "Software")
    category_2 = Category.create!(title: "Management")
    visit categories_path
    within("#category-#{category_1.id}") do
      click_link "Delete"
    end
    
    expect(page).to_not have_content(category_1.title)
    expect(page).to have_content(category_2.title)
  end 
end 