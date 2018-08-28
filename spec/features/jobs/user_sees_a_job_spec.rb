require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Software")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit job_path(job)

    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end

  describe "User can enter a comment for a job" do
    it "should show the comment on the job show page" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Software")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      comment_content = "This is a comment"

      visit job_path(job)

      fill_in "comment[content]", with: comment_content
      click_on "Submit"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content(comment_content)
    end
  end
end
