require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job_titel = "Technician"
    level_of_interest = "4"
    city = "Los Angeles"
    description = "easy work"

    visit new_job_path

    select "Software", from: "Category"
    select "ESPN", from: "Company"
    fill_in "job[title]", with: job_titel
    fill_in "job[level_of_interest]", with: level_of_interest
    fill_in "job[city]", with: city
    fill_in "job[description]", with: description

    click_button "Create Job"

    expect(current_path).to eq(job_path(Job.last))
    expect(page).to have_content("ESPN")
    expect(page).to have_content(job_titel)
    expect(page).to have_content(level_of_interest)
    expect(page).to have_content(city)
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
