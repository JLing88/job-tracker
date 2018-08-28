require 'rails_helper'

describe 'user can edit a job' do
  describe 'they link from index page' do
    describe 'they fill in the edit form' do
      it 'shows the job index with updated information' do
        company = Company.create!(name: "ESPN")
        category = Category.create!(title: "Software")
        job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
        job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 878, city: "New York City", category_id: category.id)
        job_titel = "Technician"
        level_of_interest = "4"
        city = "Los Angeles"
        description = "easy work"

        visit jobs_path
        within("#job-#{job_1.id}") do
          click_on("Edit")
        end

        expect(current_path).to eq(edit_job_path(job_1))

        fill_in "job[title]", with: job_titel
        fill_in "job[level_of_interest]", with: level_of_interest
        fill_in "job[city]", with: city
        fill_in "job[description]", with: description
        click_on "Update"
        
        expect(current_path).to eq(jobs_path)
        expect(page).to have_content(job_titel)
        expect(page).to have_content(level_of_interest)
        expect(page).to have_content(city)
        expect(page).to_not have_content("Developer")
        expect(page).to_not have_content("70")
        expect(page).to_not have_content("Denver")
      end
    end
  end
  
  describe "user can add a new category" do
    describe "they link from the edit job page" do
      it "should direct to the create new category form" do 
        company = Company.create!(name: "ESPN")
        category = Category.create!(title: "Software")
        job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
        
        visit edit_job_path(job)
        click_link "Add New Category"
        
        expect(current_path).to eq(new_category_path)
      end 
    end 
  end   
end
