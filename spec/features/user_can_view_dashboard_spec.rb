require 'rails_helper'

describe 'User visits the dashboard' do
  it 'it displays the count of jobs by level of interest' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 1, city: "New York City", category_id: category.id)
    job_3 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
    job_4 = company.jobs.create!(title: "QA Analyst", level_of_interest: 2, city: "New York City", category_id: category.id)
    job_5 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
    job_6 = company.jobs.create!(title: "QA Analyst", level_of_interest: 3, city: "New York City", category_id: category.id)

    visit dashboard_path

    expect(page).to have_content("Jobs by Interest")
    expect(page).to have_content("3 1 Job")
    expect(page).to have_content("2 2 Job")
    expect(page).to have_content("1 3 Job")

  end
end
