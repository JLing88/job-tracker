require 'rails_helper'

describe 'user can see one category' do
  describe 'they link from index page' do
    it 'should show one category' do
      category_1 = Category.create!(title: "Software")
      category_2 = Category.create!(title: "Development")

      visit categories_path
      click_link(category_1.title)

      expect(current_path).to eq(category_path(category_1))
      expect(page).to have_content(category_1.title)
      expect(page).to_not have_content(category_2.title)
    end
  end

  describe 'user sees all jobs for the category' do
    it 'should list all jobs for a category' do
      category = Category.create!(title: "Software")
      company = Company.create!(name: "ESPN")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "Technician", level_of_interest: 3, city: "Boulder", category_id: category.id)

      visit category_path(category)

      expect(page).to have_content(job_1.title)
      expect(page).to have_content(job_2.title)
    end
  end

  describe 'user can create job from category show page' do
    it 'should link to create a job' do
      category = Category.create!(title: "Software")

      visit category_path(category)
      click_link "Add New Job"

      expect(current_path).to eq(new_job_path)
    end
  end

  describe 'user can delete job from category show page' do
    it 'should delete the job' do
      category = Category.create!(title: "Software")
      company = Company.create!(name: "ESPN")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "Technician", level_of_interest: 3, city: "Boulder", category_id: category.id)

      visit category_path(category)
      within("#job-#{job_1.id}") do
        click_link "Delete"
      end

      expect(page).to_not have_content(job_1.title)
      expect(page).to have_content(job_2.title)
    end
  end

  describe 'user can edit job from category show page' do
    it 'should edit the job' do
      category = Category.create!(title: "Software")
      company = Company.create!(name: "ESPN")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      job_titel = "Technician"
      level_of_interest = "4"
      city = "Los Angeles"
      description = "easy work"

      visit category_path(category)
      within("#job-#{job_1.id}") do
        click_link "Edit"
      end
      
      expect(current_path).to eq(edit_job_path(job_1))

      fill_in "job[title]", with: job_titel
      fill_in "job[level_of_interest]", with: level_of_interest
      fill_in "job[city]", with: city
      fill_in "job[description]", with: description
      click_on "Update Job"

      expect(page).to have_content(job_titel)
      expect(page).to have_content(city)
      expect(page).to have_content(level_of_interest)
      expect(page).to_not have_content("Developer")
      expect(page).to_not have_content("Denver")
      expect(page).to_not have_content("2")
    end
  end
end
