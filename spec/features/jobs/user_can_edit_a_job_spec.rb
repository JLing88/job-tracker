require 'rails_helper'

describe 'user can edit a job' do
  describe 'they link from index page' do
    describe 'they fill in the edit form' do
      it 'shows the job index with updated information' do
        company = Company.create!(name: "ESPN")
        category = Category.create!(title: "Software")
        job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
        job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 878, city: "New York City", category_id: category.id)

        visit jobs_path
        within("#job-#{job_1.id}") do
          click_on("Edit")
        end

        expect(current_path).to eq(edit_job_path(job_1))

        fill_in "job[title]", with: "Technician"
        fill_in "job[level_of_interest]", with: "4"
        fill_in "job[city]", with: "Los Angeles"
        fill_in "job[description]", with: "d;alksjd;fasdjf;adjfa;djk"
        click_on "Update"

        expect(page).to have_content("Technician")
        expect(page).to have_content("Los Angeles")
        expect(page).to have_content("4")
        expect(page).to_not have_content("Developer")
        expect(page).to_not have_content("Denver")
        expect(page).to_not have_content("70")
      end
    end
  end
end
