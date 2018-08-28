require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        category = Category.create!(title: "Software")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it {should belong_to(:category)}
    it {should have_many(:comments)}
  end

  describe ".jobs_by_interest" do
    it 'should return the number of jobs for each interest level' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "Software")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 1, city: "New York City", category_id: category.id)
      job_3 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      job_4 = company.jobs.create!(title: "QA Analyst", level_of_interest: 2, city: "New York City", category_id: category.id)
      job_5 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      job_6 = company.jobs.create!(title: "QA Analyst", level_of_interest: 3, city: "New York City", category_id: category.id)
      expect({3 => 1, 2 => 2, 1 => 3}).to eq(Job.jobs_by_interest)
    end
  end
end
