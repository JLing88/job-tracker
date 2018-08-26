require 'rails_helper'

describe 'user can delete a job' do 
  describe 'they link from the job index page' do
    it 'should delete a job' do 
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Software")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 878, city: "New York City", category_id: category.id)
      
      visit jobs_path
      within("#job-#{job_1.id}") do 
        click_link "Delete"
      end
      
      expect(page).to_not have_content(job_1.title)
      expect(page).to have_content(job_2.title)
    end 
  end 
end