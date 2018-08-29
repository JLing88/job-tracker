require 'rails_helper'

describe 'user can delete a contact' do
  describe 'they visit a company show page' do
    describe 'they click on Delete' do
      it 'should delete the contact' do
        name = "Bob Jones"
        job = "CEO"
        email = "bjones@mail.com"
        company = Company.create!(name: "Google")
        contact = company.contacts.create!(name: name, job: job, email: email)

        visit company_path(company)

        expect(current_path).to eq(company_path(company))
        expect(page).to have_content(name)
        expect(page).to have_content(job)
        expect(page).to have_content(email)

        click_link "Delete"

        expect(page).to_not have_content(name)
        expect(page).to_not have_content(job)
        expect(page).to_not have_content(email)

        expect(current_path).to eq(company_path(company))
      end
    end
  end
end
