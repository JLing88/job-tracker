require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
    it {should have_many :contacts}
  end

  describe ".top_companies_by_interest" do
    it 'returns the top 3 companies by level of interest' do
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

      expected = [company_3, company_2, company_1]
      expect(expected).to eq(Company.top_companies_by_interest)
    end
  end
end
