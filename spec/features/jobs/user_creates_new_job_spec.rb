require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")

    visit new_job_path

    select "Software", from: "Category"
    select "ESPN", from: "Company"
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
  
  describe "user can add a new category" do 
    describe "they link from the create a job page" do 
      it "should link to the create a category form" do
        company = Company.create!(name: "ESPN")
        category = Category.create!(title: "Software")
        
        visit new_job_path
        click_link "Add New Category"
        
        expect(current_path).to eq(new_category_path)
        
      end 
    end
  end 
end
