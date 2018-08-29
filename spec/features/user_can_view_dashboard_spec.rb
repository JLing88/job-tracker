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

  it 'shows count of jobs by location' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 1, city: "New York City", category_id: category.id)
    job_3 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "LA", category_id: category.id)
    job_4 = company.jobs.create!(title: "QA Analyst", level_of_interest: 2, city: "New York City", category_id: category.id)
    job_5 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
    job_6 = company.jobs.create!(title: "QA Analyst", level_of_interest: 3, city: "New York City", category_id: category.id)

    visit dashboard_path

    expect(page).to have_content("New York City Jobs 3 jobs")
    expect(page).to have_content("LA Jobs 1 jobs")
    expect(page).to have_content("Denver Jobs 2 jobs")
  end

  it 'shows top 3 companies sorted by level of interest' do
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Google")
    company_3 = Company.create!(name: "Microsoft")
    company_4 = Company.create!(name: "Apple")

    category = Category.create!(title: "Software")
    job_1 = company_1.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
    job_2 = company_1.jobs.create!(title: "QA Analyst", level_of_interest: 4, city: "Denver", category_id: category.id)
    job_3 = company_2.jobs.create!(title: "Developer", level_of_interest: 6, city: "Denver", category_id: category.id)
    job_4 = company_2.jobs.create!(title: "QA Analyst", level_of_interest: 4, city: "New York City", category_id: category.id)
    job_5 = company_2.jobs.create!(title: "Developer", level_of_interest: 2, city: "LA", category_id: category.id)
    job_6 = company_3.jobs.create!(title: "QA Analyst", level_of_interest: 5, city: "New York City", category_id: category.id)
    job_7 = company_4.jobs.create!(title: "QA Analyst", level_of_interest: 1, city: "New York City", category_id: category.id)

    visit dashboard_path

    expect(page).to have_content("#{company_3.name} 5.0 Stars #{company_2.name} 4.0 Stars #{company_1.name} 3.0 Stars")

  end
end
