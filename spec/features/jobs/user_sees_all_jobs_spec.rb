require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit company_path(company)

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_1.company.name)
    expect(page).to have_content(job_2.title)
  end

  describe "User sees jobs sorted by city" do
    it "should show all jobs sorted by city" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: 'Software')
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

      visit jobs_path(location:"Denver")

      expect(page).to have_content(job_1.title)
      expect(page).to_not have_content(job_2.title)
    end
  end

  describe "User sees jobs sorted by level of interest" do
    it "should show all jobs sorted by level_of_interest" do
      company = Company.create!(name: "ESPN")
      category = Category.create(title: 'Software')
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 4, city: "New York City", category_id: category.id)
      job_3 = company.jobs.create!(title: "Manager", level_of_interest: 1, city: "New York City", category_id: category.id)
  
      visit jobs_path(interest_level:"interest")
      
      expect(page).to have_content("QA Analyst ESPN New York City 4EditDelete Developer ESPN Denver 3EditDelete Manager ESPN New York City 1EditDelete")
    end
  end
end
