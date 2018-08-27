require 'rails_helper'

describe 'user can see all categories' do
  describe 'they link from the nav bar' do
    it 'shows all categories' do
      category_1 = Category.create!(title: "Software")
      category_2 = Category.create!(title: "Management")
      category_3 = Category.create!(title: "Human Resources")

      visit categories_path

      expect(current_path).to eq('/categories')

      expect(page).to have_content(category_1.title)
      expect(page).to have_content(category_2.title)
      expect(page).to have_content(category_3.title)
    end
  end

  describe 'user can see a count of jobs for each category' do
    it 'should show total jobs for each category' do
      category_1 = Category.create!(title: "Software")
      category_2 = Category.create!(title: "Management")
      company = Company.create!(name: "ESPN")
      job_1 = category_1.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver",  company_id: company.id)
      job_2 = category_1.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver",  company_id: company.id)
      job_3 = category_2.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver",  company_id: company.id)

      visit categories_path

      expect(page).to have_content("#{category_1.jobs.count} Jobs")
      expect(page).to have_content("#{category_2.jobs.count} Jobs")
    end
  end
end
