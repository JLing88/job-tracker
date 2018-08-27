require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit job_path(job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end
  
  describe "User can enter a comment for a job" do 
    it "should show the comment on the job show page" do 
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Software")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      visit job_path(job)
      fill_in "comment[:content]", with: "This is a comment"
      click_on "Submit"
      expect(current_parth).to eq(job_path(job))
      expect(page).to have_content("This is a comment")
      save_and_open_page
    end
  end      
end
