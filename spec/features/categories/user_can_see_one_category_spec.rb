require 'rails_helper'

describe 'user can see one category' do
  describe 'they link from index page' do
    it 'should show one category' do
      category_1 = Category.create!(title: "Software")
      category_2 = Category.create!(title: "Development")


      visit categories_path
      click_link(category_1.title)

      expect(current_path).to eq(category_path(category_1))
      expect(page).to have_content("#{category_1.title}")
      expect(page).to_not have_content("#{category_2.title}")

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
end
